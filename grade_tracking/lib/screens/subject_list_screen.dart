import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/subject_provider.dart';

class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Subject List')),
      body: Consumer<SubjectProvider>(
        builder: (context, subjectProvider, _) {
          final subjects = subjectProvider.subjects;

          if (subjects.isEmpty) {
            return Center(
              child: Text(
                'No subjects yet. Add one! ',
                style: theme.textTheme.bodyLarge,
              ),
            );
          }

          return ListView.builder(
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              final subject = subjects[index];
              return Dismissible(
                key: ValueKey(subject.name + index.toString()),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: theme.colorScheme.errorContainer,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.delete,
                    color: theme.colorScheme.onErrorContainer,
                  ),
                ),
                confirmDismiss: (direction) async {
                  return (await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Delete subject?'),
                          content: Text(
                            'Are you sure you want to delete "${subject.name}"?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('Cancel'),
                            ),
                            FilledButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text('Delete'),
                            ),
                          ],
                        ),
                      )) ??
                      false;
                },
                onDismissed: (_) {
                  context.read<SubjectProvider>().removeSubjectAt(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Deleted "${subject.name}"')),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Text(subject.name),
                    subtitle: Text('Mark: ${subject.mark}'),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Grade: ${subject.grade}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
