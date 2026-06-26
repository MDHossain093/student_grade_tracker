import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/subject_provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subjectProvider = context.watch<SubjectProvider>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _StatisticCard(
            icon: Icons.subject,
            value: '${subjectProvider.totalSubjects}',
            label: 'Total Subjects',
          ),
          const SizedBox(height: 16),
          _StatisticCard(
            icon: Icons.calculate,
            value: subjectProvider.averageMark.toStringAsFixed(2),
            label: 'Average Mark',
          ),
          const SizedBox(height: 16),
          _StatisticCard(
            icon: Icons.grade,
            value: subjectProvider.overallGrade,
            label: 'Overall Grade',
          ),
        ],
      ),
    );
  }
}

class _StatisticCard extends StatelessWidget {
  const _StatisticCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(icon, size: 40),
            const SizedBox(height: 10),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
