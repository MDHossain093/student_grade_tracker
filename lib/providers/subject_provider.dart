import 'package:flutter/material.dart';
import '../models/subject.dart';

class SubjectProvider extends ChangeNotifier {
  final List<Subject> _subjects = [];

  // Read-only list
  List<Subject> get subjects => List.unmodifiable(_subjects);

  // Add subject
  void addSubject(Subject subject) {
    _subjects.add(subject);
    notifyListeners();
  }

  // Remove subject
  void removeSubject(int index) {
    _subjects.removeAt(index);
    notifyListeners();
  }

  // Total subjects
  int get totalSubjects => _subjects.length;

  // Average mark (uses .map())
  double get averageMark {
    if (_subjects.isEmpty) return 0;

    final total = _subjects
        .map((subject) => subject.mark)
        .reduce((a, b) => a + b);

    return total / _subjects.length;
  }

  // Overall grade
  String get overallGrade {
    if (averageMark >= 80) {
      return 'A';
    } else if (averageMark >= 65) {
      return 'B';
    } else if (averageMark >= 50) {
      return 'C';
    } else {
      return 'F';
    }
  }

  // Passing subjects (uses .where())
  List<Subject> get passingSubjects {
    return _subjects.where((subject) => subject.mark >= 50).toList();
  }
}