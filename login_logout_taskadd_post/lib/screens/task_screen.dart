import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/task_model.dart';
import '../services/firestore_service.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final FirestoreService _firestoreService = FirestoreService();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  String get _userId => FirebaseAuth.instance.currentUser?.uid?? '';

  @override
  void dispose(){
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // ======Create=====
  Future<void> _showAddTaskDialog() async{
    _titleController.clear();
    _descriptionController.clear();

    await showDialog(
        context: context,
        builder: (context)=> AlertDialog(
          title: Text('Add new task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'Enter task title',
                  border: OutlineInputBorder()
                ),
                autofocus: true,
              ),

              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter task description',
                  border: OutlineInputBorder()
                ),
                maxLines: 3,
              )
            ],
          ),
          actions: [
            TextButton(
                onPressed: ()=> Navigator.pop(context),
                child: Text('Cancel')
            ),
            FilledButton(
              onPressed: () async{
                if(_titleController.text.trim().isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text("Please enter a title"),
                        backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                final task = Task(
                    title: _titleController.text.trim(),
                    description: _descriptionController.text.trim(),
                    createdAt: DateTime.now(),
                    userId: _userId,
                );

                try {
                  await _firestoreService.addTask(task);
                  if(mounted){
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Task added successfully'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                } catch(e){
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error: $e'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              },
                child: Text("Add"))
          ],
        )

    );



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Tasks"),
      backgroundColor: Colors.greenAccent,
      ),
    );
  }
}


