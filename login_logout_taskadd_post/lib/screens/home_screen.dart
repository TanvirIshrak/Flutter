import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_logout_taskadd_post/screens/post_screen.dart';
import 'package:login_logout_taskadd_post/screens/task_screen.dart';

import 'login_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Future <void> _signOut(BuildContext context) async{
  final shouldSignOut = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Sign Out"),
        content: Text("Are you sure to sign out?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false),
              child: Text("Cancel")
          ),
          FilledButton(onPressed: ()=> Navigator.pop(context,true),
              child: Text("Sign Out")
          )
        ],
      ),
  );

  if(shouldSignOut == true){
    await FirebaseAuth.instance.signOut();
    Navigator.pop(context,MaterialPageRoute(builder: (context)=> LoginScreen()));
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.greenAccent,
          actions: [
            IconButton(
                onPressed : () => _signOut(context),
                icon: Icon(Icons.logout),
                tooltip : "Sign Out"
            )

          ],
        ),
      body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                    child: Text(
                      _getInitials(user?.displayName ?? user?.email?? 'U'),
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: .bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),

                  Text("Welcome", style: TextStyle(fontWeight: .bold),),
                  SizedBox(height: 4,),

                  Text(
                    user?.email?? 'No email', style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 22,),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: .center,
                        children: [
                          Text('Account Information',
                            style: TextStyle(fontWeight: .bold, fontSize: 20),

                          ),

                          const Divider(),
                          _buildInfoRow(
                              context,
                              "User ID",
                              user?.uid?? 'N/A',
                              Icons.fingerprint,
                          ),
                          _buildInfoRow(
                            context,
                            "E-mail Verified",
                            user?.emailVerified == true? 'Yes':'No',
                            Icons.verified_outlined,
                          ),
                          _buildInfoRow(
                            context,
                            "Created",
                            _formatDate(user?.metadata.creationTime),
                            Icons.calendar_today_outlined,
                          ),
                          _buildInfoRow(
                            context,
                            "Last Sign In",
                            _formatDate(user?.metadata.lastSignInTime),
                            Icons.access_time,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  // Only show this button if mail is not verified
                  if(user?.emailVerified == false)
                    OutlinedButton.icon(
                      onPressed: () async{
                        try{
                          await user?.sendEmailVerification();
                          if(context.mounted){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Verification email sent!'),
                                backgroundColor: Colors.greenAccent,
                              )
                            );
                          }
                        } catch(e){
                          if(context.mounted){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error: $e}')
                              ),
                            );
                          }
                        }
                      },
                      icon: Icon(Icons.email_outlined),
                      label: Text('Verify email'),
                    ),
                  SizedBox(height: 10,),

                  FilledButton.icon(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> TaskScreen()));
                      },
                      label: Text('Go to task', style: TextStyle(color: Colors.black),),
                      icon : Icon(Icons.task_alt, color: Colors.black,),
                      style: FilledButton.styleFrom(backgroundColor: Colors.greenAccent),
                  ),
                  SizedBox(height: 10,),

                  FilledButton.icon(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> PostScreen()));
                    },
                    label: Text('Go to Posts', style: TextStyle(color: Colors.black),),
                    icon : Icon(Icons.article_outlined, color: Colors.black,),
                    style: FilledButton.styleFrom(backgroundColor: Colors.greenAccent),
                  ),

                ],

              ),
            ),
          )
      ),
    );
  }

  String _getInitials(String name){
    final parts = name.trim().split(' ');
    if(parts.length >=2){
      return'${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    else if(name.isNotEmpty){
      return name[0].toUpperCase();
    }
    return 'U';
  }

  Widget _buildInfoRow(
      BuildContext context,
      String label,
      String value,
      IconData icon
      ){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon, size: 20, color: Colors.grey,),
            SizedBox(width: 12,),

            Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(color: Colors.grey),
                    ),

                    Text(
                      value,
                      style: TextStyle(color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],

                ),
            ),
          ],
        ),
      );
  }

  String _formatDate(DateTime? date){
    if(date == null) return'N/A';
    return'${date.day}/${date.month}/${date.year}';
  }
}
