import 'package:bottom_navigation/screen/home_screen.dart';
import 'package:bottom_navigation/screen/info_screen.dart';
import 'package:bottom_navigation/screen/message_screen.dart';
import 'package:flutter/material.dart';
class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  final screens = [
    HomeScreen(), MessageScreen(), InfoScreen()
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(title: Text('Dash Board'),),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          onTap: (index){
            setState(() {
                currentIndex= index;
            });
          },
          currentIndex: currentIndex,
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
        BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),

      ]),
    );
  }
}
