// lib/screens/subject_list_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subject_provider.dart';

class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  Color _gradeColor(String grade, ColorScheme cs) {
    switch (grade) {
      case 'A':
        return cs.tertiary;
      case 'B':
        return cs.primary;
      case 'C':
        return cs.secondary;
      default:
        return cs.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final subjects = context.watch<SubjectProvider>().subjects;

    if (subjects.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.school_outlined,
                size: 72, color: theme.colorScheme.outlineVariant),
            const SizedBox(height: 16),
            Text(
              'No subjects yet',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap the + tab to add your first subject',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.outlineVariant,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Text(
                '${subjects.length} Subject${subjects.length == 1 ? '' : 's'}',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                'Swipe left to remove',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              final subject = subjects[index];
              final gradeColor =
                  _gradeColor(subject.grade, theme.colorScheme);

              return Dismissible(
                key: ValueKey('${subject.name}_$index'),
                direction: DismissDirection.endToStart,
                onDismissed: (_) {
                  context.read<SubjectProvider>().removeSubject(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${subject.name} removed'),
                      backgroundColor: theme.colorScheme.error,
                    ),
                  );
                },
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(Icons.delete_outline,
                      color: theme.colorScheme.onErrorContainer, size: 28),
                ),
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  elevation: 0,
                  color: theme.colorScheme.surfaceContainerLow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    child: Row(
                      children: [
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: gradeColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              subject.grade,
                              style: TextStyle(
                                color: gradeColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                subject.name,
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                subject.isPassing
                                    ? 'Passing'
                                    : 'Failing',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: subject.isPassing
                                      ? theme.colorScheme.tertiary
                                      : theme.colorScheme.error,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${subject.mark}',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '/ 100',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
