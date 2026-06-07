import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // bool? get isChecked => false;
  // bool? isChecked;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Quiz Home'),
      ),
      body: Container(
        child: ListView(
          // to stop scrolling manually
          // physics: NeverScrollableScrollPhysics(),
          children: [
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Chip(
                  label: Text('Physics',style: TextStyle(fontSize: 20),),),
                Chip(
                  label: Text('Math'),),
                Chip(
                  label: Text('English'),),
                Chip(
                  label: Text('Chemisty'),),

              ],
            ),

            ListTile(title: Text('test'), subtitle: Text('subtitle'),trailing: Icon(Icons.eighteen_mp),),
            ListTile(title: Text('test'), subtitle: Text('subtitle'),trailing: Icon(Icons.arrow_forward),),
            ListTile(
                title: Text('test'),
              subtitle: Text('subtitle'),
              trailing: Chip(
              label: Text('New'),
            ),),

            ListTile(title: Text('test'), subtitle: Text('subtitle'),trailing: Text('trailing'),),
            ListTile(title: Text('test'), subtitle: Text('subtitle'),trailing: Text('trailing'),),

          ],
        ),
      )
    );
  }
}
