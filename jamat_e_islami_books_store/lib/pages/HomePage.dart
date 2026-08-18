import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jamat_e_islami_books_store/Models/Data.dart';
import 'package:jamat_e_islami_books_store/components/BookCard.dart';
import 'package:jamat_e_islami_books_store/components/BookTile.dart';
import 'package:jamat_e_islami_books_store/pages/BookDetails/BookDetails.dart';
import 'package:jamat_e_islami_books_store/pages/HomePage/Widgets/AppBar.dart';
import 'package:jamat_e_islami_books_store/pages/HomePage/Widgets/CategoryWidget.dart';
import 'package:jamat_e_islami_books_store/pages/HomePage/Widgets/InputTextField.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  get Get => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
                          SizedBox(height: 60),

                          // Adding home app bar => pages/HomePage/Widgets/AppBar.dart
                          HomeAppbar(),

                          SizedBox(height: 35),
                          Row(
                            children: [
                              Text(
                                'Good Morning, ',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.background,
                                ),
                              ),
                              Text(
                                "Ishrak",
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.background,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  "Time to read book and enhance your knowledge",
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.background,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 35),

                          // Adding search bar => pages/HomePage/Widgets/InputTextField.dart
                          InputTextField(),

                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Topics",
                                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.background,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              // categoryData => lib/Models/Data.dart
                              // here i just called the model and the widget to a list to make the same thing in a row
                              children: categoryData.map((e) => CategoryWidget(
                                  iconPath: e["icon"]!,
                                  buttonName: e["lebel"]!,
                                ),
                              ).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Trending",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                      // eitar somoi children er [] dewa jabena
                      bookData.map((e) => BookCard(
                          title: e.title!,
                          coverURL: e.bookurl!,
                          onPressed: () {
                            // Get.to(BookDetails());
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BookDetails(book: e,)));
                          },
                        ),
                      ).toList(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                      children: [
                        Text("Your Interest"),
                      ]
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: bookData.map((e)=> BookTile(
                        title: e.title!,
                        coverURL: e.bookurl!,
                        author: e.author!,
                        price: e.price!,
                        rating: e.rating!,
                        totalRating: e.numberOfRatings!)
                        ).toList()
                    )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
