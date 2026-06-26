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

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _markController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _markController.dispose();
    super.dispose();
  }

  void _addSubject() {
    if (_formKey.currentState!.validate()) {
      final subject = Subject(
        name: _nameController.text.trim(),
        mark: int.parse(_markController.text),
      );

      context.read<SubjectProvider>().addSubject(subject);

      _nameController.clear();
      _markController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Subject added successfully'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Subject Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a subject name';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: _markController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Mark',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a mark';
                }

                final mark = int.tryParse(value);

                if (mark == null) {
                  return 'Enter a valid number';
                }

                if (mark < 0 || mark > 100) {
                  return 'Mark must be between 0 and 100';
                }

                return null;
              },
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _addSubject,
              child: const Text('Add Subject'),
            ),
          ],
        ),
      ),
    );
  }
}