import 'package:flutter/material.dart';
class imageWidget extends StatelessWidget {
  const imageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius:50,
        backgroundImage: AssetImage('assets/images/img.png'));
  }
  
}