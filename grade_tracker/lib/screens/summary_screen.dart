// lib/screens/summary_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subject_provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  Color _gradeColor(String grade, ColorScheme cs) {
    switch (grade) {
      case 'A':
        return cs.tertiary;
      case 'B':
        return cs.primary;
      case 'C':
        return cs.secondary;
      case 'F':
        return cs.error;
      default:
        return cs.onSurfaceVariant;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = context.watch<SubjectProvider>();
    final total = provider.totalSubjects;
    final avg = provider.averageMark;
    final overall = provider.overallGrade;
    final passing = provider.passingSubjects.length;
    final failing = total - passing;
    final gradeColor = _gradeColor(overall, theme.colorScheme);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          Text(
            'Result Summary',
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),

          // Overall grade card
          Card(
            elevation: 0,
            color: gradeColor.withOpacity(0.12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                children: [
                  Text(
                    'Overall Grade',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    overall,
                    style: TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.w900,
                      color: gradeColor,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    total == 0
                        ? 'Add subjects to see your grade'
                        : 'Average: ${avg.toStringAsFixed(1)} / 100',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Stats row
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  label: 'Total Subjects',
                  value: '$total',
                  icon: Icons.library_books_outlined,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  label: 'Passing',
                  value: '$passing',
                  icon: Icons.check_circle_outline,
                  color: theme.colorScheme.tertiary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  label: 'Failing',
                  value: '$failing',
                  icon: Icons.cancel_outlined,
                  color: theme.colorScheme.error,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Grade breakdown
          if (total > 0) ...[
            Text(
              'Grade Breakdown',
              style: theme.textTheme.titleSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ...['A', 'B', 'C', 'F'].map((grade) {
              final count = provider.subjects
                  .where((s) => s.grade == grade)
                  .length;
              final fraction = total > 0 ? count / total : 0.0;
              final gc = _gradeColor(grade, theme.colorScheme);
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: gc.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          grade,
                          style: TextStyle(
                            color: gc,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: fraction,
                          minHeight: 10,
                          backgroundColor:
                              theme.colorScheme.surfaceContainerHighest,
                          valueColor: AlwaysStoppedAnimation<Color>(gc),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 22,
                      child: Text(
                        '$count',
                        textAlign: TextAlign.end,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              value,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
