import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jamat_e_islami_books_store/pages/HomePage.dart';
class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Row(
        children: [
          SvgPicture.asset("Assets/Icons/back.svg"),
          SizedBox(width: 15,),
          Text("Back", style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.background),
          ),

        ],
      ),
    );
  }
}

