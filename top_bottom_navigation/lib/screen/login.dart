import 'package:flutter/material.dart';
import 'package:top_bottom_navigation/screen/home_screen.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (_)=>HomeScreen()),
                          (route)=>false); // eitar jonno routed page e r back option thakbe na
                }, child: Text('Go to Home Page'))
          ],
        ),
      ),
    );
  }
}
