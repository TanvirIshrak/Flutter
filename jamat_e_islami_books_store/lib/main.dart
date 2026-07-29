import 'package:flutter/material.dart';
import 'package:jamat_e_islami_books_store/config/Theme.dart';
import 'package:jamat_e_islami_books_store/pages/HomePage.dart';

void main() {
  runApp(const MyApp());  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jamat e Islami E-Book',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const HomePage(),
    );
  }
}
