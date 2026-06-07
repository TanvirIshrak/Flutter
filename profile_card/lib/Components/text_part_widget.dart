import 'package:flutter/material.dart';

class TextPartWidget extends StatelessWidget {
  const TextPartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: .start,
      children: [
        Text('Tanvir Ishrak', style: TextStyle(fontSize: 25, fontWeight: .w500)),
        SizedBox(height: 7,),
        Text('App Developer || ML Engineer',style: TextStyle(fontSize: 17,), textAlign: TextAlign.center,),
        SizedBox(height: 12 ,),
        Text('Passionate about creating apps and train AI models.Always in search of new things and learn them',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}