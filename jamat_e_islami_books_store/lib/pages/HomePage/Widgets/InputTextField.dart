import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.background,
      ),
      child: Row(
        children: [
          SizedBox(width: 20,),
          SvgPicture.asset('Assets/Icons/search.svg'),
          SizedBox(width: 20,),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none  // to remove the line under the box
                  ),
                  hintText: "Search here..",
                hintStyle: Theme.of(context).textTheme.labelMedium
              ),
            ),
          )
        ],
      ),
    );
  }
}
