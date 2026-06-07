import 'package:flutter/material.dart';
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Quiz'),),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Text('Question 1/10', style: TextStyle(fontWeight: .w600),),
            )
          ],
        ),
      ),
    );
  }
}
