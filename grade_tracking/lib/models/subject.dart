class Subject {
  final String name;
  final int _mark;

  Subject({required this.name, required int mark}) : _mark = mark {
    if (name.trim().isEmpty) {
      throw ArgumentError('Subject name must not be empty');
    }
    if (mark < 0 || mark > 100) {
      throw ArgumentError('Mark must be between 0 and 100');
    }
  }

  int get mark => _mark;

  String get grade {
    if (_mark >= 80) return 'A+';
    if (_mark >= 75) return 'A';
    if (_mark >= 70) return 'A-';
    if (_mark >= 65) return 'B';
    if (_mark >= 60) return 'B-';
    if (_mark >= 55) return 'C';
    if (_mark >= 50) return 'C-';
    if (_mark >= 45) return 'D';
    if (_mark >= 40) return 'D-';
    return 'F';
  }
}
