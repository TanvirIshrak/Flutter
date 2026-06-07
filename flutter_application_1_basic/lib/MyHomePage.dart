import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  {
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  TextEditingController name= TextEditingController();
  TextEditingController password = TextEditingController();

  // initState(){
  //   super.initState();
  //   name.text='Him';
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text('June 04')),
        body: Container(

          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(20),
            ),

          child: Column(  // row or column
          mainAxisAlignment: MainAxisAlignment.center,  //maintains up-down
          crossAxisAlignment: CrossAxisAlignment.start, // maintains left-right
          children: [
            Text('Hello Ishrak', style: TextStyle(fontSize: 20)),
            Text('Flutter is kinda good', style: TextStyle(fontSize: 30)),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  border: OutlineInputBorder(),
                ),
                controller: name,
              ),
            ),
            //for password
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your Password',
                  border: OutlineInputBorder(),
                ),
                controller: password,
              ),
            ),
            ElevatedButton(
              onPressed: (){
                print(name.text);
                print(password.text);
                // print('Click me');
                },
              child: Text('Click me'),)
          ],
                ),
        ),

        floatingActionButton: FloatingActionButton.extended(onPressed:(){},
        label: Text('+')),
    );
  }
}

class appdetail extends StatelessWidget {
  const appdetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('You have pushed the button this many times:');
  }
}
