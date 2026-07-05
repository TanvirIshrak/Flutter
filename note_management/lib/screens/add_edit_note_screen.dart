import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/note.dart';
import '../services/firestore_note_service.dart';

class AddEditNoteScreenArgs {
  const AddEditNoteScreenArgs({this.noteId});

  final String? noteId;

  bool get isEdit => noteId != null;
}

class AddEditNoteScreen extends StatefulWidget {
  const AddEditNoteScreen({super.key});

  static const String routeName = '/add_edit_note';

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  bool _isSaving = false;

  String? _noteId;
  late final FirestoreNoteService _noteService;

  @override
  void initState() {
    super.initState();
    _noteService = FirestoreNoteService();

    // Read args after first frame (context available).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is AddEditNoteScreenArgs) {
        _noteId = args.noteId;
        if (_noteId != null) {
          _loadNote(_noteId!);
        }
      }
    });
  }

  Future<void> _loadNote(String id) async {
    final doc = await FirebaseFirestore.instance
        .collection('notes')
        .doc(id)
        .get();
    if (!doc.exists) return;

    final data = doc.data();
    if (data == null) return;

    final note = Note.fromMap(id: doc.id, map: data);

    if (!mounted) return;
    setState(() {
      _titleController.text = note.title;
      _descriptionController.text = note.description;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = _noteId != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit Note' : 'Add Note')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final v = value?.trim() ?? '';
                  if (v.isEmpty) return 'Title is required';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                minLines: 4,
                maxLines: 8,
                validator: (value) {
                  final v = value?.trim() ?? '';
                  if (v.isEmpty) return 'Description is required';
                  return null;
                },
              ),
              const SizedBox(height: 18),
              ElevatedButton.icon(
                onPressed: _isSaving
                    ? null
                    : () async {
                        final formOk =
                            _formKey.currentState?.validate() ?? false;
                        if (!formOk) return;

                        setState(() => _isSaving = true);

                        final title = _titleController.text.trim();
                        final description = _descriptionController.text.trim();

                        try {
                          if (_noteId == null) {
                            await _noteService.createNote(
                              title: title,
                              description: description,
                            );
                          } else {
                            await _noteService.updateNote(
                              id: _noteId!,
                              title: title,
                              description: description,
                            );
                          }

                          if (!mounted) return;
                          Navigator.of(context).pop();
                        } catch (e) {
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Save failed: $e')),
                            );
                          }
                        } finally {
                          if (mounted) setState(() => _isSaving = false);
                        }
                      },
                icon: Icon(isEdit ? Icons.save : Icons.add),
                label: Text(isEdit ? 'Save Changes' : 'Create Note'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
