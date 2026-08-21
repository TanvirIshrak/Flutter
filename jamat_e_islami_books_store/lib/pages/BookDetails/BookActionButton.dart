import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jamat_e_islami_books_store/pages/BookPage/BookPage.dart';
class BookActionButton extends StatelessWidget {
  final String bookUrl;
  const BookActionButton({super.key, required this.bookUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> BookPage(bookUrl: bookUrl,)));
              },
              child: Row(
                children: [
                  SvgPicture.asset("Assets/Icons/book.svg"),

                  SizedBox(width: 20,),
                  Text("Read Book", style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.background),
                  )

                ],
              ),
            ),
          ),
          Container(
            width: 2,
            height: 30,
            color: Theme.of(context).colorScheme.background,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                SvgPicture.asset("Assets/Icons/play.svg"),
                SizedBox(width: 20,),
                Text("Play Book", style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.background),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
