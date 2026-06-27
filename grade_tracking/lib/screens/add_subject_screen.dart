import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/subject_provider.dart';

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Add Subject')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Subject name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: theme.colorScheme.outline),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _markController,
                decoration: InputDecoration(
                  labelText: 'Mark (0-100)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: theme.colorScheme.outline),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Mark is required';
                  }
                  final parsed = int.tryParse(value.trim());
                  if (parsed == null) {
                    return 'Mark must be a number';
                  }
                  if (parsed < 0 || parsed > 100) {
                    return 'Mark must be between 0 and 100';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              FilledButton.icon(
                icon: const Icon(Icons.add),
                onPressed: () {
                  final formState = _formKey.currentState;
                  if (formState == null) return;
                  if (!formState.validate()) return;

                  final name = _nameController.text.trim();
                  final mark = int.parse(_markController.text.trim());

                  context.read<SubjectProvider>().addSubject(
                    name: name,
                    mark: mark,
                  );

                  // Clear inputs without setState.
                  _nameController.clear();
                  _markController.clear();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Added "$name" ($mark)')),
                  );
                },
                label: const Text('Add'),
              ),
              const SizedBox(height: 16),
              Text(
                'Tip: Swipe-delete subjects on the list screen.',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
