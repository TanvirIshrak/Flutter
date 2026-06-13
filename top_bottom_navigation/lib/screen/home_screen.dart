import 'package:flutter/material.dart';
import 'package:top_bottom_navigation/screen/product_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('HomePage'),),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            ElevatedButton(
                onPressed: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductScreen()));
                  Navigator.pushNamed(context, '/product');
                },
                child: Text('Enter to the Products segment'))
          ],
        ),
      ),
    );
  }
}
