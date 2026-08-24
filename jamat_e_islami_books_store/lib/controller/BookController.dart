import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

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
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      print(image.path);
      // uploadImageToFirebase(File(image.path))
    }
  }
}
