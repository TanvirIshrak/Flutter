class Note {
  final String id;
  final String title;
  final String description;

  const Note({
    required this.id,
    required this.title,
    required this.description,
  });

  factory Note.fromMap({
    required String id,
    required Map<String, dynamic> map,
  }) {
    return Note(
      id: id,
      title: (map['title'] ?? '') as String,
      description: (map['description'] ?? '') as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {'title': title, 'description': description};
  }
}
