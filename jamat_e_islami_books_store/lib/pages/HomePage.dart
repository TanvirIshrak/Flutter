import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 600,
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: [
                  Text("Welcome to Homepage")
                ],
              ),
            ),

          ],
        ),

      ),
    );
  }
}
