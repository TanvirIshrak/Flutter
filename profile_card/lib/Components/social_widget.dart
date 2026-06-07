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
          Icon(Icons.gite),
          Icon(Icons.whatshot),
          Icon(Icons.filter),
          // FaIcon(FontAwesomeIcons.github),
          // FaIcon(FontAwesomeIcons.fire),
          // FaIcon(FontAwesomeIcons.linkedin),
        ],
      ),
    );
  }
}