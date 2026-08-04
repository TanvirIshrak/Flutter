import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CategoryWidget extends StatelessWidget {
  final String iconPath;
  final String buttonName;
  const CategoryWidget({super.key, required this.iconPath, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: (){},
        child: Container(

          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(10)
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              SvgPicture.asset(iconPath),
              SizedBox(width: 10,),
              Text(buttonName)
            ],
          ),
        ),
      ),
    );
  }
}
