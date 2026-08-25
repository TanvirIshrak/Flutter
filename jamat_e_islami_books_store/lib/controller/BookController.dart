import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:uuid/uuid.dart';

class BookController extends GetxController {
  // TextEditingControllers for each form field.
  final title = TextEditingController();
  final description = TextEditingController();
  final author = TextEditingController();
  final aboutAuthor = TextEditingController();
  final category = TextEditingController();
  final language = TextEditingController();
  final pages = TextEditingController();
  final price = TextEditingController();
  final audioLength = TextEditingController();

  final imagePicker = ImagePicker(); // for uploading book image

  final stroage = FirebaseStorage.instance;
  final db = FirebaseFirestore.instance;

  final RxnString imageUrl = RxnString(); // download URL after upload
  final RxString imageFileName = "".obs; // local path of picked image
  final RxBool isUploading = false.obs;
  final RxString uploadError = "".obs;
  // Reactive state for picked files / UI text.
  final RxString pdfFile = "No file chosen".obs;
  final RxString audioFile = "No file chosen".obs;

  final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    title.dispose();
    description.dispose();
    author.dispose();
    aboutAuthor.dispose();
    category.dispose();
    language.dispose();
    pages.dispose();
    price.dispose();
    audioLength.dispose();
    super.onClose();
  }

  /// Reset all fields and selected files back to defaults.
  void resetAll() {
    title.clear();
    description.clear();
    author.clear();
    aboutAuthor.clear();
    category.clear();
    language.clear();
    pages.clear();
    price.clear();
    audioLength.clear();
    pdfFile.value = "No file chosen";
    audioFile.value = "No file chosen";
  }

  void pickImage() async {
    uploadError.value = "";
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      print("Picked image path: ${image.path}");
      imageFileName.value = image.path;
      await uploadImageToFirebase(File(image.path));
    }
  }

  Future<void> uploadImageToFirebase(File image) async {
    try {
      isUploading.value = true;
      // Validate the local file actually exists on disk before attempting
      // to upload. On some Android emulators image_picker returns a temp path
      // that has already been cleaned up.
      if (!await image.exists()) {
        throw Exception(
          "Local image file no longer exists at ${image.path}. "
          "Try picking the image again.",
        );
      }

      var uuid = Uuid();
      var filename = "${uuid.v1()}.jpg";
      var storageRef = stroage.ref().child("pdfImages/$filename");

      // Upload with explicit content-type so the file is served back correctly.
      final metadata = SettableMetadata(contentType: "image/jpeg");
      var response = await storageRef.putFile(image, metadata);

      // Guard: if the upload task itself failed (e.g. storage rules denied
      // the write), putFile still returns a snapshot but `response.totalBytes
      // == 0` and the resulting `getDownloadURL()` call throws the cryptic
      // "object-not-found". Detect that here and throw a clearer error.
      if (response.totalBytes <= 0) {
        throw Exception(
          "Upload returned 0 bytes. This usually means Firebase Storage "
          "rules blocked the write. Check the 'storage.rules' file and "
          "publish it from the Firebase console.",
        );
      }

      String downloadUrl = await response.ref.getDownloadURL();
      imageUrl.value = downloadUrl;
      print("Image uploaded successfully. Download URL: $downloadUrl");
    } catch (e, st) {
      uploadError.value = "Upload failed: $e";
      print("Upload error: $e\n$st");
    } finally {
      isUploading.value = false;
    }
  }

  final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();

  /// Reactive state for uploaded media URLs.
  final RxnString pdfUrl = RxnString();
  final RxnString audioUrl = RxnString();
  final RxBool isPdfUploading = false.obs;
  final RxBool isAudioUploading = false.obs;
  final RxString pdfError = "".obs;
  final RxString audioError = "".obs;

  /// Pick a PDF from device storage and upload it to Firebase Storage under
  /// `pdfFiles/<uuid>.pdf`. On success, updates [pdfFile] (display name) and
  /// [pdfUrl] (download URL).
  void pickPdf() async {
    pdfError.value = "";
    try {
      // Newer versions of file_picker (>=8.x) return a `List<PlatformFile>`
      // directly instead of a `FilePickerResult` wrapper.
      final picked = await file_picker.FilePicker.pickFiles(
        type: file_picker.FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (picked.isEmpty) return;
      final file = picked.first;

      // file_picker may return an empty path on some platforms (e.g. when
      // bytes are loaded but the file isn't on disk).
      if (file.path == null) {
        throw Exception("Could not access the picked PDF file path.");
      }

      final localFile = File(file.path!);
      pdfFile.value = file.name; // show the user-selected name in UI

      isPdfUploading.value = true;
      final bytes = await localFile.readAsBytes();
      final filename = "${const Uuid().v1()}.pdf";
      final ref = stroage.ref().child("pdfFiles/$filename");
      final response = await ref.putData(
        bytes,
        SettableMetadata(contentType: "application/pdf"),
      );
      if (response.totalBytes <= 0) {
        throw Exception(
          "PDF upload returned 0 bytes. Firebase Storage rules may be "
          "blocking the write. Publish storage.rules and try again.",
        );
      }
      final downloadUrl = await response.ref.getDownloadURL();
      pdfUrl.value = downloadUrl;
      print("PDF uploaded successfully. Download URL: $downloadUrl");
    } catch (e, st) {
      pdfError.value = "PDF upload failed: $e";
      print("PDF upload error: $e\n$st");
    } finally {
      isPdfUploading.value = false;
    }
  }

  /// Pick an audio file from device storage and upload it to Firebase Storage
  /// under `audioFiles/<uuid>.<ext>`. On success, updates [audioFile] and
  /// [audioUrl].
  void pickAudio() async {
    audioError.value = "";
    try {
      final picked = await file_picker.FilePicker.pickFiles(
        type: file_picker.FileType.audio,
      );
      if (picked.isEmpty) return;
      final file = picked.first;
      if (file.path == null) {
        throw Exception("Could not access the picked audio file path.");
      }

      final localFile = File(file.path!);
      audioFile.value = file.name;

      isAudioUploading.value = true;
      final bytes = await localFile.readAsBytes();
      // Preserve the original extension if we have it; default to mp3.
      final ext = (file.extension ?? "mp3").toLowerCase();
      final filename = "${const Uuid().v1()}.$ext";
      final ref = stroage.ref().child("audioFiles/$filename");
      final response = await ref.putData(bytes);
      if (response.totalBytes <= 0) {
        throw Exception(
          "Audio upload returned 0 bytes. Firebase Storage rules may be "
          "blocking the write. Publish storage.rules and try again.",
        );
      }
      final downloadUrl = await response.ref.getDownloadURL();
      audioUrl.value = downloadUrl;
      print("Audio uploaded successfully. Download URL: $downloadUrl");
    } catch (e, st) {
      audioError.value = "Audio upload failed: $e";
      print("Audio upload error: $e\n$st");
    } finally {
      isAudioUploading.value = false;
    }
  }
}
