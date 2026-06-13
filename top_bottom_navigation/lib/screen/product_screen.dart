import 'package:flutter/material.dart';
import 'package:top_bottom_navigation/screen/setting_screen.dart';
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Product Page'),),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Back btn")),

            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>SettingScreen(pagename: null)));
                }, child: Text('Go to settings'))

          ],
        ),
      ),
    );
  }
}

