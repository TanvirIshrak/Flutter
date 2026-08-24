import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:jamat_e_islami_books_store/config/Theme.dart';
import 'package:jamat_e_islami_books_store/firebase_options.dart';
import 'package:jamat_e_islami_books_store/pages/SplashScreenPage/SplashScreen.dart';
import 'package:jamat_e_islami_books_store/pages/WelcomePage/WelcomePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
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
