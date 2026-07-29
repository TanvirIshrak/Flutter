import 'package:flutter/material.dart';
import 'package:weather_app_project/screens/home_screen.dart';
import 'package:weather_app_project/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(MyApp(isLoggedIn: isLoggedIn,));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
            primarySwatch: Colors.blue
        ),
        // home: const HomeScreen(),
        routes: {
          '/login': (_) => const LoginPage(), //creating login screen route
          '/home': (_) => HomeScreen(), // creating homescreen route
        },
        initialRoute: isLoggedIn ? '/home' : '/login'
    );
  }
}
