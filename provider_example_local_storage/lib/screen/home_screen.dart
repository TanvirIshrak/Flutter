import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/counter_provider.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Consumer<CounterProvider>(
  builder: (context, provider, child) {
  return Text(
              '${provider.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            );
  },
),
          ],
        ),
      ), 
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<CounterProvider>().decrement();
        },
        // tooltip: 'Increment',
        child: const Icon(Icons.deblur),
      ),

    );
  }
}
