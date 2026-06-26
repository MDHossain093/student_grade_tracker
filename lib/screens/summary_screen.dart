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
          Card(
            child: ListTile(
              leading: const Icon(Icons.subject),
              title: const Text('Total Subjects'),
              trailing: Text(
                '${subjectProvider.totalSubjects}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),

          const SizedBox(height: 16),

          Card(
            child: ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text('Average Mark'),
              trailing: Text(
                subjectProvider.averageMark.toStringAsFixed(2),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),

          const SizedBox(height: 16),

          Card(
            child: ListTile(
              leading: const Icon(Icons.grade),
              title: const Text('Overall Grade'),
              trailing: Text(
                subjectProvider.overallGrade,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}