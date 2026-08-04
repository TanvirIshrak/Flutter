import 'package:flutter/material.dart';
import 'package:jamat_e_islami_books_store/components/PrimaryButton.dart';
import 'package:jamat_e_islami_books_store/config/colors.dart';
import 'package:jamat_e_islami_books_store/pages/HomePage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Home Page'),),
      body: Column(
          children: [
            Container(
              height: 600,
              color: Theme.of(context).colorScheme.primary,
              child: Row(
                mainAxisAlignment: .center,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: .center,
                      children: [
                        // Text("Welcome to Homepage")
                        Image.asset(
                          "Assets/Images/book.png",
                          width: 300,
                        ),
                        SizedBox(height: 20,),
                        Text("E-Book store",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: .bold
                          ),
                        ),
                        Text("Here is the ultimate book store to read books without any problem ",
                            // "any hassle ",
                            textAlign: .center,
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.background
                            ),
                        )
                      ],
                    ),
                  )
                ],
                
              ),
            ),
            SizedBox(height: 30,),
            // Spacer(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: PrimaryButton(
                  buttonName: "Enter into the library",
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
                  }
              )
            )

          ],
        ),


    );
  }
}

