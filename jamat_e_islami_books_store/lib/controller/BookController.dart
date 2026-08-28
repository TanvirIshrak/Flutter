import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:jamat_e_islami_books_store/config/cloudinary.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:uuid/uuid.dart';

/// Manages the "Add New Book" form state and uploads every picked asset
/// (cover image, PDF, optional audio) directly to **Cloudinary**.
///
/// The upload uses Cloudinary's **unsigned upload preset** so no API
/// secret is shipped with the app. See `lib/config/cloudinary.dart`.
class BookController extends GetxController {
  // Form fields
  final title = TextEditingController();
  final description = TextEditingController();
  final author = TextEditingController();
  final aboutAuthor = TextEditingController();
  final category = TextEditingController();
  final language = TextEditingController();
  final pages = TextEditingController();
  final price = TextEditingController();
  final audioLength = TextEditingController();

  final imagePicker = ImagePicker();
  final Uuid _uuid = const Uuid();
  final formKey = GlobalKey<FormState>();

  // Reactive UI state
  final RxnString imageUrl = RxnString();
  final RxString imageFileName = "".obs;
  final RxBool isUploading = false.obs;
  final RxString uploadError = "".obs;

  final RxString pdfFile = "No file chosen".obs;
  final RxString audioFile = "No file chosen".obs;

  final RxnString pdfUrl = RxnString();
  final RxnString audioUrl = RxnString();
  final RxBool isPdfUploading = false.obs;
  final RxBool isAudioUploading = false.obs;
  final RxString pdfError = "".obs;
  final RxString audioError = "".obs;

  final RxBool isPublishing = false.obs;
  final RxString publishError = "".obs;

  final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();

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

  /// Reset every field back to its initial state.
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
    imageFileName.value = "";
    imageUrl.value = null;
    pdfUrl.value = null;
    audioUrl.value = null;
    uploadError.value = "";
    pdfError.value = "";
    audioError.value = "";
    publishError.value = "";
  }

  // Image upload
  void pickImage() async {
    uploadError.value = "";
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (image == null) return;
    imageFileName.value = image.path;
    await uploadImageToCloudinary(File(image.path));
  }

  Future<void> uploadImageToCloudinary(File image) async {
    try {
      isUploading.value = true;
      if (!await image.exists()) {
        throw Exception(
          "Local image file no longer exists at ${image.path}.",
        );
      }
      final filename = "${_uuid.v1()}.jpg";
      final url = await uploadAsset(
        file: image,
        resourceType: 'image',
        folder: CloudinaryConfig.coversFolder,
        publicId: filename,
      );
      imageUrl.value = url;
    } catch (e) {
      uploadError.value = "Image upload failed: $e";
    } finally {
      isUploading.value = false;
    }
  }

  // PDF upload
  void pickPdf() async {
    pdfError.value = "";
    try {
      final picked = await file_picker.FilePicker.pickFiles(
        type: file_picker.FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (picked.isEmpty) return;
      final file = picked.first;
      if (file.path == null) {
        throw Exception("Could not access the picked PDF file path.");
      }
      final localFile = File(file.path!);
      pdfFile.value = file.name;

      isPdfUploading.value = true;
      final filename = "${_uuid.v1()}.pdf";
      final url = await uploadAsset(
        file: localFile,
        // Use `image` so Cloudinary serves the PDF inline (no
        // `Content-Disposition: attachment` header). The PDF still
        // opens correctly in `SfPdfViewer.network` because Cloudinary
        // auto-detects the format and sets `Content-Type: application/pdf`.
        resourceType: 'image',
        folder: CloudinaryConfig.pdfsFolder,
        publicId: filename,
      );
      pdfUrl.value = url;
    } catch (e) {
      pdfError.value = "PDF upload failed: $e";
    } finally {
      isPdfUploading.value = false;
    }
  }

  // Audio upload
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
      final ext = (file.extension ?? "mp3").toLowerCase();
      final filename = "${_uuid.v1()}.$ext";
      final url = await uploadAsset(
        file: localFile,
        resourceType: 'raw',
        folder: CloudinaryConfig.audioFolder,
        publicId: filename,
      );
      audioUrl.value = url;
    } catch (e) {
      audioError.value = "Audio upload failed: $e";
    } finally {
      isAudioUploading.value = false;
    }
  }

  /// Returns a JSON map containing every uploaded URL + form value. When
  /// you add a real database just POST this map to it.
  Map<String, dynamic>? publishBook() {
    publishError.value = "";

    // Light sanity checks — only block on missing uploads, not on
    // empty text fields, since the form isn't wrapped in a Form widget
    // (we use plain TextFormFields with no validators).
    if (imageUrl.value == null) {
      publishError.value = "Please upload a cover image first.";
      return null;
    }
    if (pdfUrl.value == null) {
      publishError.value = "Please upload a PDF first.";
      return null;
    }
    if (title.text.trim().isEmpty) {
      publishError.value = "Please enter a book title.";
      return null;
    }

    isPublishing.value = true;
    final book = <String, dynamic>{
      "id": _uuid.v4(),
      "title": title.text.trim(),
      "description": description.text.trim(),
      "author": author.text.trim(),
      "aboutauthor": aboutAuthor.text.trim(),
      "category": category.text.trim(),
      "language": language.text.trim(),
      "pages": int.tryParse(pages.text.trim()) ?? 0,
      "price": price.text.trim(),
      "audiolen": audioLength.text.trim(),
      "coverImagePath": imageUrl.value,
      "coverURL": imageUrl.value,
      "bookurl": pdfUrl.value,
      "audiourl": audioUrl.value,
      "rating": 0.0,
      "numberOfRatings": 0,
      "createdAt": DateTime.now().toIso8601String(),
    };
    isPublishing.value = false;
    return book;
  }

  // Core Cloudinary upload. Returns secure_url on success.
  Future<String> uploadAsset({
    required File file,
    required String resourceType,
    required String folder,
    required String publicId,
  }) async {
    final endpoint = CloudinaryConfig.uploadEndpoint(resourceType);
    final uri = Uri.parse(endpoint);
    final request = http.MultipartRequest('POST', uri)
      ..fields['upload_preset'] = CloudinaryConfig.uploadPreset
      ..fields['folder'] = folder
      ..fields['public_id'] = publicId
      ..files.add(await http.MultipartFile.fromPath('file', file.path));

    final streamed = await request.send();
    final response = await http.Response.fromStream(streamed);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception(
        "Cloudinary responded ${response.statusCode}: ${response.body}",
      );
    }
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final url = body['secure_url'] as String?;
    if (url == null || url.isEmpty) {
      throw Exception("Cloudinary response missing secure_url: ${response.body}");
    }
    return url;
  }
}
