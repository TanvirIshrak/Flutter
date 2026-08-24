enum MessageStatus { sent, delivered, read }

enum MessageType { text, image, audio }

class Message {
  final String id;
  final String text;
  final DateTime time;
  final bool isMe;
  final MessageStatus status;
  final MessageType type;

  Message({
    required this.id,
    required this.text,
    required this.time,
    required this.isMe,
    this.status = MessageStatus.sent,
    this.type = MessageType.text,
  });

  Message copyWith({
    String? text,
    MessageStatus? status,
  }) {
    return Message(
      id: id,
      text: text ?? this.text,
      time: time,
      isMe: isMe,
      status: status ?? this.status,
      type: type,
    );
  }
}
