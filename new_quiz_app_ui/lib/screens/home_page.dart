import 'package:flutter/material.dart';
import 'package:new_quiz_app_ui/screens/quiz.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Quiz Home",style: TextStyle(fontSize: 25, fontWeight: .w600)),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text('Choose Category', style: TextStyle(fontSize: 20, fontWeight: .w600),),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Chip(
                    label: Text('Physics', style: TextStyle(fontSize: 17),),
                  ),Chip(
                    label: Text('Chemistry', style: TextStyle(fontSize: 17)),
                  ),Chip(
                    label: Text('Math', style: TextStyle(fontSize: 17)),
                  ),Chip(
                    label: Text('Biology', style: TextStyle(fontSize: 17)),
                  )
                ],
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Container(
                width: 100,
                height: 2,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Container(
                child: Column(
                  children: [

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20))
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => Quiz()));
                        },
                        child: ListTile(title: Text('Flatter Basic'),
                          subtitle: Text('10 Questions'),
                          trailing: Icon(Icons.arrow_forward),) ),

                    SizedBox(height: 20,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20))
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>Quiz()));
                        },
                        child: ListTile(title: Text('Physics mcq'),
                          subtitle: Text('30 Questions'),
                          trailing: Icon(Icons.arrow_forward),) ),

                    SizedBox(height: 20,),
                    Card(
                      child: Container(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('Math mcq'),
                              subtitle: Text('10 Questions'),
                              trailing: Icon(Icons.arrow_forward),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
