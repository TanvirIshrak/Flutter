import 'package:auth_example/viewmodels/auth_viewmodel.dart';
import 'package:auth_example/views/home_screen.dart';
import 'package:auth_example/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login' : (context)=>LoginScreen(),
        '/home' : (context)=>HomeScreen(),
      },
    );
  }
}
