import 'package:flutter/material.dart';

import 'components/button_widget.dart';
import 'components/image_widget.dart';
import 'components/social_widget.dart';
import 'components/text_widget.dart';


class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.green.shade300,
      // appBar: AppBar(
      //   title: Text('Personal Info', style: TextStyle(fontWeight: .w600),),
      // ),
      body: SafeArea(
        child: Center(
          child: Container(
            // width: 350,
            // height: 550,
            width: MediaQuery.of(context).size.width*0.87,
            height: MediaQuery.of(context).size.height*0.6,
            padding: EdgeInsets.all(20),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: .center,
                children: [
                  imageWidget(),

                  SizedBox(height: 26,),
                  textWidget(),

                  SizedBox(height: 30,),
                  socialWidget(),

                  SizedBox(height: 20,),
                  buttonWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

