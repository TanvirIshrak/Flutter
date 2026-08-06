import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class BookTile  extends StatelessWidget {
  final String title;
  final String coverURL;
  final String author;
  final String price;
  final double rating;
  final num totalRating;
  const BookTile ({super.key, required this.title, required this.coverURL, required this.author, required this.price, required this.rating, required this.totalRating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10),
          // color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            children: [
              Container(
                // decoration for behind book shadow
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context,).colorScheme.primary.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(30),
                  child: Image.asset(
                    coverURL,
                    height: 80,
                    width: 100,
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(title, style: Theme.of(context).textTheme.bodyMedium,),
                      Text("By: ${author}",style: Theme.of(context).textTheme.labelSmall),
                      SizedBox(height: 3,),
                      Text("Price: ${price}",style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.secondary)
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("Assets/Icons/star.svg"),
                          Text("${rating}",style: Theme.of(context).textTheme.labelSmall),
                          Text("   (${totalRating}rating)", style: Theme.of(context).textTheme.labelSmall)
                        ],
                      )
                    ],
                  )
              )

            ],
          ),
        ),
      ),
    );
  }
}
