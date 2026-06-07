import 'package:flutter/material.dart';
import 'package:new_quiz_app_ui/screens/home_page.dart';

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
            Icon(Icons.quiz, size: 100, color: Colors.blue,),
            Text('Quiz App', style: TextStyle(fontSize: 30, fontWeight: .w800),),

            SizedBox(height: 40,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
            },
                child: Text('Enter', style: TextStyle(color: Colors.blue),))
          ],
        ),
      ),
    );
  }
}
