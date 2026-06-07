import 'package:flutter/material.dart';
class textWidget extends StatelessWidget {
  const textWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Tanvir Ishrak', style: TextStyle(fontSize: 30, fontWeight: .w500),),
        Text('ML Engineer  || App Developer', style: TextStyle(fontSize: 18, fontWeight: .w400),),
        SizedBox(height: 25,),
        Text('Enthusias to learn extrea ordinay things . Always available to learn new things. Looking for excelence',
          style: TextStyle(fontSize: 17,),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}