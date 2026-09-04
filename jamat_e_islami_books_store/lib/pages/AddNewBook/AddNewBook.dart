import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamat_e_islami_books_store/components/AppBackButton.dart';
import 'package:jamat_e_islami_books_store/components/PrimaryButton.dart';
import 'package:jamat_e_islami_books_store/controller/BookController.dart';
import 'package:jamat_e_islami_books_store/controller/BookRepository.dart';
import 'package:jamat_e_islami_books_store/Models/BookModel.dart';

class AddNewBook extends StatelessWidget {
  const AddNewBook({super.key});

  @override
  Widget build(BuildContext context) {
    // Register the controller with GetX. It will be auto-disposed when this
    // route is removed from the stack.
    final BookController bookController = Get.put(BookController());

    final cs = Theme.of(context).colorScheme;
    final fill = cs.primary.withOpacity(0.08);
    final border = cs.primary.withOpacity(0.25);

    InputDecoration deco(String label, IconData icon) => InputDecoration(
      isDense: true,
      filled: true,
      fillColor: fill,
      labelText: label,
      prefixIcon: Icon(icon, size: 20),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: cs.primary, width: 1.4),
      ),
    );

    Widget field({
      required String label,
      required IconData icon,
      required TextEditingController controller,
      TextInputType? type,
      int? maxLines,
    }) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        maxLines: maxLines ?? 1,
        style: Theme.of(context).textTheme.bodySmall,
        decoration: deco(label, icon),
      ),
    );

    Widget section(BuildContext context, String title) => Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 2),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          letterSpacing: 1.2,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
              color: cs.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: AppBackButton(),
                            ),
                            Text(
                              "Add New Book",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: cs.background),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // upload image section
                        InkWell(
                          onTap: () {
                            bookController.pickImage();
                          },
                          child: Container(
                            height: 140,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: cs.onPrimaryContainer.withOpacity(0.5),
                            ),
                            child: Obx(() {
                              final localPath =
                                  bookController.imageFileName.value;
                              if (localPath.isNotEmpty &&
                                  File(localPath).existsSync()) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    File(localPath),
                                    fit: BoxFit.cover,
                                    width: 110,
                                    height: 140,
                                  ),
                                );
                              }
                              return Icon(
                                Icons.add_a_photo_outlined,
                                color: cs.background,
                              );
                            }),
                          ),
                        ),
                        const SizedBox(height: 6),
                        // Upload progress / status / download URL line
                        Obx(() {
                          if (bookController.isUploading.value) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    cs.background,
                                  ),
                                ),
                              ),
                            );
                          }
                          if (bookController.uploadError.value.isNotEmpty) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                top: 4,
                                left: 8,
                                right: 8,
                              ),
                              child: Text(
                                bookController.uploadError.value,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(color: Colors.redAccent),
                              ),
                            );
                          }
                          final url = bookController.imageUrl.value;
                          if (url != null) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                top: 4,
                                left: 8,
                                right: 8,
                              ),
                              child: Text(
                                "Uploaded ✓\n$url",
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(color: cs.background),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        }),
                        const SizedBox(height: 8),
                        Text(
                          "Author",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: cs.background),
                        ),
                        // Text(
                        //   "tanvirishrak@gmail.com",
                        //   style: Theme.of(context).textTheme.bodySmall
                        //       ?.copyWith(
                        //         color: cs.onPrimaryContainer.withOpacity(0.6),
                        //       ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // form
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  section(context, "Book Details"),
                  field(
                    label: "Book Title",
                    icon: Icons.menu_book_outlined,
                    controller: bookController.title,
                  ),
                  field(
                    label: "Description",
                    icon: Icons.description_outlined,
                    controller: bookController.description,
                    maxLines: 6,
                  ),
                  field(
                    label: "Author",
                    icon: Icons.person_outline,
                    controller: bookController.author,
                  ),
                  field(
                    label: "About Author",
                    icon: Icons.person_pin_outlined,
                    controller: bookController.aboutAuthor,
                    maxLines: 6,
                  ),
                  const SizedBox(height: 4),
                  section(context, "Classification"),
                  field(
                    label: "Category",
                    icon: Icons.category_outlined,
                    controller: bookController.category,
                  ),
                  field(
                    label: "Language",
                    icon: Icons.language_outlined,
                    controller: bookController.language,
                  ),
                  field(
                    label: "Pages",
                    icon: Icons.layers_outlined,
                    controller: bookController.pages,
                    type: TextInputType.number,
                  ),
                  field(
                    label: "Price",
                    icon: Icons.attach_money,
                    controller: bookController.price,
                    type: TextInputType.number,
                  ),
                  const SizedBox(height: 4),
                  section(context, "Media Files"),
                  field(
                    label: "Audio Length (e.g. 1h 30m)",
                    icon: Icons.headphones_outlined,
                    controller: bookController.audioLength,
                  ),

                  // PDF + audio upload segment
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: cs.primary.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.picture_as_pdf_outlined,
                              size: 20,
                              color: cs.primary,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Book PDF",
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        // Reactive text for the picked PDF file name.
                        Obx(
                          () => Text(
                            bookController.pdfFile.value,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: cs.onPrimaryContainer),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Obx(
                                () => OutlinedButton.icon(
                                  onPressed: bookController.isPdfUploading.value
                                      ? null
                                      : bookController.pickPdf,
                                  icon: bookController.isPdfUploading.value
                                      ? const SizedBox(
                                          height: 14,
                                          width: 14,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        )
                                      : const Icon(Icons.upload_file, size: 18),
                                  label: Text(
                                    bookController.isPdfUploading.value
                                        ? "Uploading..."
                                        : "Choose PDF",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    side: BorderSide(color: cs.primary),
                                    foregroundColor: cs.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Obx(
                                () => OutlinedButton.icon(
                                  onPressed:
                                      bookController.isAudioUploading.value
                                      ? null
                                      : bookController.pickAudio,
                                  icon: bookController.isAudioUploading.value
                                      ? const SizedBox(
                                          height: 14,
                                          width: 14,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        )
                                      : const Icon(Icons.audiotrack, size: 18),
                                  label: Text(
                                    bookController.isAudioUploading.value
                                        ? "Uploading..."
                                        : "Choose Audio",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    side: BorderSide(color: cs.primary),
                                    foregroundColor: cs.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Error labels for PDF / Audio, reactively shown.
                        Obx(
                          () => bookController.pdfError.value.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Text(
                                    bookController.pdfError.value,
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(color: Colors.redAccent),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                        Obx(
                          () => bookController.audioError.value.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Text(
                                    bookController.audioError.value,
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(color: Colors.redAccent),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 4),
                  PrimaryButton(
                    buttonName: bookController.isPublishing.value
                        ? "Publishing..."
                        : "Publish Book",
                    onPressed: () {
                      final book = bookController.publishBook();
                      if (book == null) {
                        Get.snackbar(
                          "Cannot publish",
                          bookController.publishError.value.isEmpty
                              ? "Please review the form."
                              : bookController.publishError.value,
                          snackPosition: SnackPosition.BOTTOM,
                        );
                        return;
                      }
                      // `book` is a Map<String, dynamic> with every Cloudinary
                      // secure_url + form value. Save it into the in-memory
                      // repository so HomePage shows the new book right away.
                      // Swap this single line with a Firestore / Supabase
                      // insert when you add a real backend.
                      BookRepository.instance.addBook(
                        BookModel.fromJson(book),
                      );
                      Get.snackbar(
                        "Published",
                        "Book uploaded to Cloudinary. "
                            "Cover + PDF + audio ready.",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                        icon: const Icon(Icons.check_circle, color: Colors.white),
                        margin: const EdgeInsets.all(12),
                        borderRadius: 10,
                        duration: const Duration(seconds: 3),
                      );
                      bookController.resetAll();
                      Get.back();
                    },
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: bookController.resetAll,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red, width: 1.4),
                        foregroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Cancel",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
