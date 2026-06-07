import 'package:flutter/material.dart';
import 'package:quiz_app/screen/home_page.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Icon(Icons.quiz,
              size: 100,
              color: Colors.blue,
            ),
            Text('Quiz App', style: TextStyle(fontSize: 20, fontWeight: .w600),),
            ElevatedButton(onPressed: (){

              // moving one page to another page
              Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));

            }, child: Text('Enter'))
          ],
        ),
      ),
    );
  }
}
