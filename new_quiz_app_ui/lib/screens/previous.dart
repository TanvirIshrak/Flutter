
Scaffold(
appBar: AppBar(title: Text("Quiz")),
body: Container(
child: ListView(
children: [
Padding(
padding: const EdgeInsets.symmetric(horizontal: 18.0),
child: Text('Question 1/10', style: TextStyle(fontSize: 20, fontWeight: .w600),),
),
SizedBox(height: 20,),
Padding(
padding: const EdgeInsets.symmetric(horizontal: 18.0),
child: Text('What is Flutter?',style: TextStyle(fontSize: 30, fontWeight: .w600),),
),

Padding(
padding: const EdgeInsets.symmetric(horizontal: 18.0),
child: Container(
child: Column(
children: [
Card(
child: ListTile(title: Text('Toolkit'),
leading: Radio(value: 1,),
trailing: Icon(Icons.info),
),
),
Card(
child: ListTile(title: Text('Database'),
leading: Radio(value: 1,),
trailing: Icon(Icons.info),
),
),
Card(
child: ListTile(title: Text('IDE'),
leading: Radio(value: 1,),
trailing: Icon(Icons.info),
),
),
Card(
child: ListTile(title: Text('Language'),
leading: Radio(value: 1,),
trailing: Icon(Icons.info),
),
),
],
),
),
),

Padding(
padding: const EdgeInsets.symmetric(vertical: 350.0),
child: Container(
height: 60,
width: .infinity,
child: Row(
mainAxisAlignment: .center,
children: [
SizedBox(
height:50,
width: 180,
child: ElevatedButton(
onPressed: (){},
child: Text('Previous', style: TextStyle(fontSize: 20, color: Colors.deepPurpleAccent),))),
SizedBox(width: 20,),
SizedBox(
height: 50,
width: 180,
child: ElevatedButton(
onPressed: (){},
child: Text('Next', style: TextStyle(fontSize: 20, color: Colors.deepPurpleAccent),)))
],
),
),
),
],
),
),
);