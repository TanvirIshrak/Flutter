import 'package:flutter/material.dart';
class StudentForm extends StatelessWidget {
  const StudentForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController idController = TextEditingController();
    final TextEditingController deptController = TextEditingController();
    final TextEditingController universitynameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Form', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,),

        body : Container(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Form(
          key : _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name"),
              ),
              TextFormField(
                controller: idController,
                decoration: InputDecoration(labelText: "ID"),
              ),
              TextFormField(
                controller: deptController,
                decoration: InputDecoration(labelText: "Dept"),
              ),
              TextFormField(
                controller: universitynameController,
                decoration: InputDecoration(labelText: "University"),
              ),
              TextFormField(
                controller: emailController,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Please Enter Some Text";
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: "E-mail"),
              ),

              ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      print("Mail is submitting");
                    }
                  },
                  child: Text('Submit')),

              SizedBox(height: 40,),
              GestureDetector(
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    print("link is submitting");
                  }
                },
                child: Text('Press the link',
                    style: TextStyle(decoration: TextDecoration.underline,)),
              ),

              SizedBox(height: 40,),
              InkWell(
                  // hoverColor: Colors.lightBlue.shade300,
                splashColor: Colors.blue,

                onTap: (){
                  if(_formKey.currentState!.validate()){
                    print("Comment is submitting");
                  }
                },
                child: Icon(Icons.insert_comment_rounded)
              ),

              
          ],),
        ),
      )
    );
  }
}
