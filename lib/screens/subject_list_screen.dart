import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/subject_provider.dart';

class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subjectProvider = context.watch<SubjectProvider>();

    if (subjectProvider.subjects.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.menu_book,
              size: 90,
            ),
            const SizedBox(height: 20),
            Text(
              'No Subjects Added Yet',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: subjectProvider.subjects.length,
      itemBuilder: (context, index) {
        final subject = subjectProvider.subjects[index];

        return Dismissible(
          key: ValueKey(subject.name + index.toString()),
          direction: DismissDirection.endToStart,
          onDismissed: (_) {
            context.read<SubjectProvider>().removeSubject(index);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${subject.name} deleted'),
              ),
            );
          },
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            color: Colors.red,
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          child: Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text(subject.grade),
              ),
              title: Text(
                subject.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Mark: ${subject.mark}'),
              trailing: Chip(
                label: Text(subject.grade),
              ),
            ),
          ),
        );
      },
    );
  }
}
