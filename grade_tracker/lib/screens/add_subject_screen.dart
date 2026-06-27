// lib/screens/add_subject_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/subject.dart';
import '../providers/subject_provider.dart';

class AddSubjectScreen extends StatefulWidget {
  const AddSubjectScreen({super.key});

  @override
  State<AddSubjectScreen> createState() => _AddSubjectScreenState();
}

class _AddSubjectScreenState extends State<AddSubjectScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _markController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _markController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final subject = Subject(
        name: _nameController.text.trim(),
        mark: int.parse(_markController.text.trim()),
      );
      context.read<SubjectProvider>().addSubject(subject);
      _nameController.clear();
      _markController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${subject.name} added successfully!'),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Text(
              'Add a New Subject',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Subject Name',
                prefixIcon: Icon(Icons.book_outlined,
                    color: theme.colorScheme.primary),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide(color: theme.colorScheme.outline),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: theme.colorScheme.primary, width: 2),
                ),
              ),
              textCapitalization: TextCapitalization.words,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Subject name cannot be empty';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _markController,
              decoration: InputDecoration(
                labelText: 'Mark (0 – 100)',
                prefixIcon: Icon(Icons.grade_outlined,
                    color: theme.colorScheme.primary),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide(color: theme.colorScheme.outline),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: theme.colorScheme.primary, width: 2),
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Mark cannot be empty';
                }
                final parsed = int.tryParse(value.trim());
                if (parsed == null) {
                  return 'Please enter a valid whole number';
                }
                if (parsed < 0 || parsed > 100) {
                  return 'Mark must be between 0 and 100';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: _submit,
              icon: const Icon(Icons.add),
              label: const Text('Add Subject',
                  style: TextStyle(fontSize: 16)),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: theme.colorScheme.surfaceContainerHighest,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.info_outline,
                        size: 18, color: theme.colorScheme.onSurfaceVariant),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'A ≥ 80  •  B ≥ 65  •  C ≥ 50  •  F < 50',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
