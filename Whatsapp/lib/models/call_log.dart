enum CallType { incoming, outgoing, missed }

class CallLog {
  final String id;
  final String name;
  final String emoji;
  final List<int> color;
  final DateTime time;
  final CallType type;

  CallLog({
    required this.id,
    required this.name,
    required this.emoji,
    required this.color,
    required this.time,
    required this.type,
  });
}
