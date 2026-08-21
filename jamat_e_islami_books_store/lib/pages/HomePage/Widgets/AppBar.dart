import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jamat_e_islami_books_store/pages/ProfilePage/ProfilePage.dart';
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
        InkWell(
          onTap: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilPage()));
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilPage()),);
          },
          child: CircleAvatar(
            
            backgroundColor: Theme.of(context).colorScheme.background,
            child: Text(
              'N',
              style: TextStyle(color: Colors.black,),),
          ),
        )
      ],
    );
  }
}
