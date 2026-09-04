import 'package:flutter/material.dart';
import 'package:jamat_e_islami_books_store/Models/Data.dart';
import 'package:jamat_e_islami_books_store/config/Theme.dart';
import 'package:jamat_e_islami_books_store/controller/BookRepository.dart';
import 'package:jamat_e_islami_books_store/pages/HomePage/HomePage.dart';
import 'package:jamat_e_islami_books_store/pages/Login Page/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Read the persisted login flag BEFORE runApp so the very first frame
  // already lands on the right screen (no flash of login or splash).
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  // Seed the in-memory book repository with the hardcoded catalogue.
  // Cloudinary uploads use direct HTTPS, no async SDK init needed here.
  BookRepository.instance.books.addAll(bookData);

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLoggedIn});

  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islamist',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: isLoggedIn ? '/home' : '/login',
      routes: {
        '/login': (_) => const LoginPage(),
        '/home': (_) => const Homepage(),
      },
    );
  }
}
