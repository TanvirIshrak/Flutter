import 'package:flutter/material.dart';
import 'package:top_bottom_navigation/screen/home_screen.dart';
import 'package:top_bottom_navigation/screen/login.dart';
import 'package:top_bottom_navigation/screen/product_screen.dart';
import 'package:top_bottom_navigation/screen/setting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/":(context)=>HomeScreen(),
        "/product":(context)=>ProductScreen(),
        "/setting":(context)=>SettingScreen(),
        // "/":(context)=>HomeScreen(),

      },
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: HomeScreen(),
    );
  }
}
