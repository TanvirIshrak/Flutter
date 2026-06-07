import 'package:flutter/material.dart';
class socialWidget extends StatelessWidget {
  const socialWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 58.0),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Icon(Icons.facebook),
          Icon(Icons.whatshot_sharp),
          Icon(Icons.line_axis),
          Icon(Icons.gite),
        ],
      ),
    );
  }
}