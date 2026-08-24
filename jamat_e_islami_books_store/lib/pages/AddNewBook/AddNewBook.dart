import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamat_e_islami_books_store/components/AppBackButton.dart';
import 'package:jamat_e_islami_books_store/components/PrimaryButton.dart';
import 'package:jamat_e_islami_books_store/controller/BookController.dart';

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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
    }) =>
        Padding(
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
              padding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: cs.background),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Container(
                          height: 140,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: cs.onPrimaryContainer.withOpacity(0.5),
                          ),
                          child:Icon(
                              Icons.add_a_photo_outlined,
                              color: cs.background,
                            ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Tanvir Ishrak",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: cs.background),
                        ),
                        Text(
                          "tanvirishrak@gmail.com",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: cs.onPrimaryContainer.withOpacity(0.6)),
                        ),
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
                            Icon(Icons.picture_as_pdf_outlined,
                                size: 20, color: cs.primary),
                            const SizedBox(width: 8),
                            Text(
                              "Book PDF",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        // Reactive text for the picked PDF file name.
                        Obx(() => Text(
                              bookController.pdfFile.value,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: cs.onPrimaryContainer),
                            )),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () async {
                                  // Pick a PDF using file_picker / image_picker etc.
                                  // Update the reactive name when chosen.
                                  // book.pdfFile.value = pickedFileName;
                                },
                                icon: const Icon(Icons.upload_file, size: 18),
                                label: Text(
                                  "Choose PDF",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall,
                                ),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10),
                                  side: BorderSide(color: cs.primary),
                                  foregroundColor: cs.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () async {
                                  // Pick an audio file similarly.
                                  // book.audioFile.value = pickedFileName;
                                },
                                icon: const Icon(Icons.audiotrack, size: 18),
                                label: Text(
                                  "Choose Audio",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall,
                                ),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10),
                                  side: BorderSide(color: cs.primary),
                                  foregroundColor: cs.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 4),
                  PrimaryButton(
                    buttonName: "Publish Book",
                    onPressed: () {
                      // TODO: publish using book.* field values.
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
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
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