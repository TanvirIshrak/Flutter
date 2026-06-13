import 'package:flutter/material.dart';
class ListviewWidget extends StatefulWidget {
  const ListviewWidget({super.key});

  @override
  State<ListviewWidget> createState() => _ListviewWidgetState();
}

class _ListviewWidgetState extends State<ListviewWidget> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('ListView', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,),
      body: ListView.separated(
          itemCount: 10,
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

          separatorBuilder: (BuildContext context, int index) { return Divider(); },
      ),
    );
  }
}
