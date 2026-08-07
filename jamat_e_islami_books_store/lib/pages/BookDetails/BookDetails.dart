import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jamat_e_islami_books_store/components/AppBackButton.dart';
import 'package:jamat_e_islami_books_store/config/colors.dart';
class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Container(
            height: 600,
            color: Theme.of(context).colorScheme.primary,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [

                              // BackButton(), // it is already defines so we may can use it by just calling or use our customised one

                              // lib/components/AppBackButton.dart
                              AppBackButton(),

                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: SvgPicture.asset("Assets/Icons/heart.svg",color: backgroundColor,),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
