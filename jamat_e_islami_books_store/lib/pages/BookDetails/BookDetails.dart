import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jamat_e_islami_books_store/components/AppBackButton.dart';
import 'package:jamat_e_islami_books_store/config/colors.dart';
import 'package:jamat_e_islami_books_store/pages/BookDetails/BookActionButton.dart';
import 'package:jamat_e_islami_books_store/pages/BookDetails/Header.dart';
class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              height: 550,
              color: Theme.of(context).colorScheme.primary,
              child: Row(
                children: [
                  Expanded(
                    // lib / pages/ BookDetails/ Header.dart
                    child: HeaderDetails()
                  )

                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("About Book", style: Theme.of(context).textTheme.bodyMedium,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Flexible(
                        child: Text("মূলত রাজনৈতিক ও ঐতিহাসিক প্রেক্ষাপটে রচিত একটি পরিচিত বই, যার লেখক জামায়াতে ইসলামীর সাবেক আমীর অধ্যাপক গোলাম আযম।",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("About Author", style: Theme.of(context).textTheme.bodyMedium,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Flexible(
                        child: Text("লেখক জামায়াতে ইসলামীর সাবেক আমীর অধ্যাপক গোলাম আযম।",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),

                  // lib/pages/BookDetails/BookActionButton.dart
                  BookActionButton()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
