import 'package:flutter/material.dart';
class buttonWidget extends StatelessWidget {
  const buttonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 280,
      child: ElevatedButton(onPressed: (){
        print('Connection sent');
      },
        child: Text('Connect', style: TextStyle(fontSize: 25, color: Colors.white),),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(borderRadius: .circular(10))
        ),
      ),
    );
  }
}