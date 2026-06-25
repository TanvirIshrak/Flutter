import 'package:designing_3_layers_go_rought_provider/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Home Screen"),),

      body: Column(
        mainAxisAlignment: .center,
        children: [
          Icon(Icons.flutter_dash, size: 120,),
          SizedBox(height: 20,),
          
          Text("Welcome to my Flutter app",
            style: TextStyle(fontSize: 20, fontWeight: .bold),
          ),

          SizedBox(height: 20,),
          CustomButton(
              text: 'Profile Screen',
              onPressed: (){
                context.push('/profile');
              }
          ),
          SizedBox(height: 20,),
          CustomButton(
              text: 'Settings Screen',
              onPressed: (){
                context.push('/settings');
              }
          ),

        ],
      ),
    );
  }
}
