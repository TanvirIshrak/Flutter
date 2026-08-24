class StatusUpdate {
  final String id;
  final String name;
  final String emoji;
  final List<int> color;
  final DateTime time;
  final bool viewed;

  StatusUpdate({
    required this.id,
    required this.name,
    required this.emoji,
    required this.color,
    required this.time,
    this.viewed = false,
  });
}
