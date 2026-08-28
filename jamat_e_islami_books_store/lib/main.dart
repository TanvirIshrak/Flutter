import 'package:flutter/material.dart';
import 'package:jamat_e_islami_books_store/Models/Data.dart';
import 'package:jamat_e_islami_books_store/config/Theme.dart';
import 'package:jamat_e_islami_books_store/controller/BookRepository.dart';
import 'package:jamat_e_islami_books_store/pages/SplashScreenPage/SplashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Seed the in-memory book repository with the 16 hardcoded books
  // (their PDFs live on Cloudinary under islami_books/pdfs/...). New
  // books published via AddNewBook are appended on top.
  BookRepository.instance.books.addAll(bookData);
  // Cloudinary uploads use direct HTTPS, no async SDK init needed here.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islamic E-Book',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      // home: const WelcomePage(),
      home: const SplashScreen(),
    );
  }
}
