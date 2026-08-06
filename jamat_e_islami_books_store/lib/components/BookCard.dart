import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String coverURL;
  final String title;
  final VoidCallback onPressed;

  const BookCard({super.key, required this.coverURL, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          width : 100,
          child: Column(
            children: [
              Container(
                // decoration for behind book shadow
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(1, 1)
                      )
                    ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(30),
                  child: Image.asset(
                    coverURL,
                    height: 100,
                    width: 200,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                title,
                maxLines: 1,  // to solve line overflow issue
                textAlign: .center,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
