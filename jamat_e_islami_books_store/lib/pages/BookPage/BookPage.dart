import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:jamat_e_islami_books_store/components/AppBackButton.dart';
import 'package:jamat_e_islami_books_store/config/colors.dart';
import 'package:jamat_e_islami_books_store/controller/PDFController.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  get _pdfViewerKey => null;

  @override
  Widget build(BuildContext context) {
    PdfController pdfController = Get.put(PdfController());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: backgroundColor),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Book Title",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pdfController.pdfViewerKey.currentState?.openBookmarkView();
        },
        child: Icon(
          Icons.bookmark_add_outlined,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
      body: SfPdfViewer.network(
        'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
        key: pdfController.pdfViewerKey,
      ),
    );
  }
}
