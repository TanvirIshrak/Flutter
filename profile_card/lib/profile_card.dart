import 'package:flutter/material.dart';

import 'Components/button_widget.dart';
import 'Components/image_widget.dart';
import 'Components/social_widget.dart';
import 'Components/text_part_widget.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    // print('Width: ${MediaQuery.of(context).size.width*0.9}');
    // print('Height: ${MediaQuery.of(context).size.height*0.6}');

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Person\'s Info"),
      // ),
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(  // alternate of appbar
        child: Center(
          child: Card(
            child: Container(
              // width: 350,
              // height: 500,
              // making the height width dynamic to devices
              width: MediaQuery.of(context).size.width*0.87,
              height: MediaQuery.of(context).size.height*0.6,
              padding: EdgeInsets.all(20),

              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                children: [
                ImageWidget(),
                TextPartWidget(),
                // social connections
                SizedBox(height: 30,),
                socialWidget(),

                SizedBox(height: 20,),
                ButtonWidget(),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}


