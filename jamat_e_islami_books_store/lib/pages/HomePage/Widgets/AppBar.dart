import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: .center,
      mainAxisAlignment: .spaceBetween,
      children: [
        SvgPicture.asset("Assets/Icons/dashboard.svg"),
        Text(
            "E-Book",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.background
            )
        ),
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.background,
          child: Text(
            'N',
            style: TextStyle(color: Colors.black,),),
        )
      ],
    );
  }
}
