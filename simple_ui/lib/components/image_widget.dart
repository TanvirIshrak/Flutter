import 'package:flutter/material.dart';
class imageWidget extends StatelessWidget {
  const imageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.asset("assets/images/resource.jpg"));
  }
}