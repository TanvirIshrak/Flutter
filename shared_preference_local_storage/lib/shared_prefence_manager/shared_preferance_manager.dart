import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserData()async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', 'Ishrak');
  await prefs.setInt('age', 23);
}
Future<void> readUserData()async{
  final prefs = await SharedPreferences.getInstance();
  var username = prefs.getString('username');
  print(username);
  var age = prefs.getInt('age');
  print(age);
}
