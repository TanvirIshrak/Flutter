import 'package:flutter/foundation.dart';

import '../models/subject.dart';

class SubjectProvider extends ChangeNotifier {
  final List<Subject> _subjects = [];

  List<Subject> get subjects => List.unmodifiable(_subjects);

  void addSubject({required String name, required int mark}) {
    _subjects.add(Subject(name: name, mark: mark));
    notifyListeners();
  }

  void removeSubjectAt(int index) {
    _subjects.removeAt(index);
    notifyListeners();
  }

  int get totalSubjects => _subjects.length;

  double get averageMark {
    if (_subjects.isEmpty) return 0;
    final total = _subjects.map((s) => s.mark).fold<int>(0, (a, b) => a + b);
    return total / _subjects.length;
  }

  // Uses `where` as required.
  int get passingCount {
    final passing = _subjects.where((s) => s.grade != 'F');
    return passing.length;
  }

  String get overallGrade {
    if (_subjects.isEmpty) return '-';
    final avg = averageMark;
    if (avg >= 80) return 'A+';
    if (avg >= 65) return 'B';
    if (avg >= 55) return 'C';
    return 'F';
  }
}
