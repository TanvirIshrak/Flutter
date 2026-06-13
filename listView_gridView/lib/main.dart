import 'package:flutter/material.dart';
import 'package:listview_gridview/screen/gridview_widget.dart';
import 'package:listview_gridview/screen/listview_widget.dart';
import 'package:listview_gridview/screen/student_form.dart';

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
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: const ListviewWidget(),
      home: const StudentForm(),
    );
  }
}

