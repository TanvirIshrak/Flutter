import 'package:flutter/material.dart';

import 'message.dart';

class Chat {
  final String id;
  final String name;
  final String avatarEmoji;
  final List<int> avatarColor;
  final List<Message> messages;
  final DateTime? lastTime;
  final String? lastPreview;
  final int unreadCount;
  final bool online;
  final bool typing;

  Chat({
    required this.id,
    required this.name,
    required this.avatarEmoji,
    required this.avatarColor,
    this.messages = const [],
    this.lastTime,
    this.lastPreview,
    this.unreadCount = 0,
    this.online = false,
    this.typing = false,
  });

  Color get color => Color(
        (0xFF << 24) |
            ((avatarColor[0] & 0xFF) << 16) |
            ((avatarColor[1] & 0xFF) << 8) |
            (avatarColor[2] & 0xFF),
      );
}
