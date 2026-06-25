import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back)),
        title: Text('Profile Screen'),),
      body: Column(
        children: [
          Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person, size: 60,),
                  ),
                ),

                SizedBox(height: 20, width: 60,),

                Column(
                  mainAxisAlignment: .center,
                  children: [
                    Text('Tanvir Ishrak', style: TextStyle(fontSize: 24, fontWeight: .bold),),
                    Text('tanvir2963@gmail.com', style: TextStyle(fontSize: 14),),
                    Text('Department of CSE', style: TextStyle(fontSize: 14),),
                  ],
                ),



              ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person, size: 60,),
                ),
              ),

              SizedBox(height: 20, width: 60,),

              Column(
                mainAxisAlignment: .center,
                children: [
                  Text('Ahammad', style: TextStyle(fontSize: 24, fontWeight: .bold),),
                  Text('ahammad@gmail.com', style: TextStyle(fontSize: 14),),
                  Text('Department of Math', style: TextStyle(fontSize: 14),),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
