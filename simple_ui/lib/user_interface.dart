import 'package:flutter/material.dart';

import 'components/image_widget.dart';

class UserIn extends StatelessWidget {
  const UserIn({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(title: ,),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: .start,
          children: [
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
               child: Text('Make every day a learning journey', style: TextStyle(fontSize: 46, fontWeight: .w800, height: 0.9)),
             ),

            imageWidget(),

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text('An engaging way to master new languages and connect with custures worldwide',
                style:TextStyle(fontWeight: .w500) ,),
            ),

            // SizedBox(height: 20,),
            Spacer(),
            // button part
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: .infinity,
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigoAccent,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20))
                ),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: .spaceBetween ,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Start Learning',style: TextStyle(fontSize: 20,color: Colors.white),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(Icons.arrow_forward, color: Colors.white, size: 35,fontWeight: .w100,),
                        )

                      ],
                    )),
              ),
            ),
            SizedBox(height: 60,)
          ],
        ),
      )
    );
  }
}


