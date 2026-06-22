import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: Column(
        children: [
          Text('Hello World'),
          ElevatedButton(onPressed: (){
            context.go('/product_details');
          }, child: Text('Enter Product'))
        ],
      ),

    );
  }
}
