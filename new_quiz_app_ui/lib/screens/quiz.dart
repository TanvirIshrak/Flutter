import 'package:flutter/material.dart';
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Quiz'),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23.0),
        child: Container(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 20,),
              Text('Question 1/10', style: TextStyle(fontWeight: .w600, fontSize: 20),),

              SizedBox(height: 20,),
              Flexible(child: Text('What is Flutter?', style: TextStyle(fontWeight: .w600, fontSize: 30),)),

              Expanded(
                  child: ListView(
                    children: [
                      Card(
                        child: ListTile(
                          title: Text('Toolkit'),
                          leading: Radio<int>(value: 1,),
                          trailing: Icon(Icons.info),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Database'),
                          leading: Radio<int>(value: 1,),
                          trailing: Icon(Icons.info),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Language'),
                          leading: Radio<int>(value: 1,),
                          trailing: Icon(Icons.info),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('IDE'),
                          leading: Radio<int>(value: 1,),
                          trailing: Icon(Icons.info),
                        ),
                      ),
                    ],
                  )
              ),

              Spacer(),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Expanded(
                    child: SizedBox(
                        height: 60,
                        child: ElevatedButton(
                            onPressed: (){},
                            child: Text('Previous')
                        )
                    ),
                  ),

                  SizedBox(width: 20,),
                  Expanded(
                    child: SizedBox(
                        height: 60,
                        child: ElevatedButton(
                            onPressed: (){},
                            child: Text('Next')
                        )
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );

  }
}
