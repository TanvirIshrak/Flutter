import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jamat_e_islami_books_store/components/AppBackButton.dart';
import 'package:jamat_e_islami_books_store/config/colors.dart';
import 'package:jamat_e_islami_books_store/pages/BookDetails/Header.dart';
class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
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
          )
        ],
      ),
    );
  }
}
