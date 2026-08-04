import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jamat_e_islami_books_store/Models/Data.dart';
import 'package:jamat_e_islami_books_store/pages/HomePage/Widgets/AppBar.dart';
import 'package:jamat_e_islami_books_store/pages/HomePage/Widgets/CategoryWidget.dart';
import 'package:jamat_e_islami_books_store/pages/HomePage/Widgets/InputTextField.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // upper blue bar container
          Container(
            padding: EdgeInsets.all(10),
            color: Theme.of(context).colorScheme.primary,
            height: 400,
            child: Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 60,),

                        // Adding home app bar => pages/HomePage/Widgets/AppBar.dart
                        HomeAppbar(),

                        SizedBox(height: 35,),
                        Row(
                          children: [
                            Text(
                                'Good Morning, ',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.background
                                )
                            ),
                            Text(
                              "Ishrak",
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.background
                              )
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                  "Time to read book and enhance your knowledge",
                                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                      color: Theme.of(context).colorScheme.background
                                  )
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 35,),

                        // Adding search bar => pages/HomePage/Widgets/InputTextField.dart
                        InputTextField(),

                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Text("Topics", style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: Theme.of(context).colorScheme.background
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            // categoryData => lib/Models/Data.dart
                            // here i just called the model and the widget to a list to make the same thing in a row
                            children: categoryData.map((e) => CategoryWidget(iconPath: e["icon"]!, buttonName: e["lebel"]!,)).toList()

                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
