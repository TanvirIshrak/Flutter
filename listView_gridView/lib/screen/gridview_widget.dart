import 'package:flutter/material.dart';
class GridviewWidget extends StatefulWidget {
  const GridviewWidget({super.key});

  @override
  State<GridviewWidget> createState() => _ListviewWidgetState();
}

class _ListviewWidgetState extends State<GridviewWidget> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('ListView', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,),
      body: GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8
        ),
        itemBuilder: (context, index){
          return Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.teal[100 * ((index%8)+1)],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text('Item ${index+1}', style: TextStyle(fontSize: 24, color: Colors.white),),
            ),
          );
        },


      ),
    );
  }
}
