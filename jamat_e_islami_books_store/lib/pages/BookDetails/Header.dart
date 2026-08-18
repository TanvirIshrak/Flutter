import 'package:flutter/material.dart';

import '../../components/AppBackButton.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/colors.dart';

class HeaderDetails extends StatelessWidget {
  final String title;
  final String author;
  final String coverURL;
  final String rating;
  final int pages;
  final String language;
  final String audio;
  final String description;
  const HeaderDetails({super.key, required this.title, required this.author, required this.coverURL, required this.rating, required this.pages, required this.language, required this.audio, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60),
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            // BackButton(), // it is already defines so we may can use it by just calling or use our customised one
            // lib/components/AppBackButton.dart
            AppBackButton(),

            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                "Assets/Icons/heart.svg",
                color: backgroundColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        Row(
          // crossAxisAlignment: .start,
          mainAxisAlignment: .center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(
                        context,
                      ).colorScheme.onBackground.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 7,
                      offset: Offset(9, 9),
                    ),
                  ],
                ),
                child: Image.asset(
                  coverURL,
                  width: 200,
                  height: 200,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
        Text(
          "Author: $author",
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(context).colorScheme.background.withOpacity(0.6),
          ),
        ),
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Rating",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.background.withOpacity(0.6),
                  ),
                ),
                Text(
                  rating,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Pages",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.background.withOpacity(0.6),
                  ),
                ),
                Text(
                  pages.toString(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Language",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.background.withOpacity(0.6),
                  ),
                ),
                Text(
                  language,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Audio",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.background.withOpacity(0.6),
                  ),
                ),
                Text(
                  audio,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
