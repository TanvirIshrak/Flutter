import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';

import '../data/dummy_data.dart';
import '../models/call_log.dart';
import '../models/chat.dart';
import '../models/message.dart';
import '../models/status.dart';

class ChatProvider extends ChangeNotifier {
  final List<Chat> _chats = DummyData.getChats();
  final List<StatusUpdate> _statuses = DummyData.getStatuses();
  final List<CallLog> _calls = DummyData.getCalls();

  String _meName = 'You';

  List<Chat> get chats => List.unmodifiable(_chats);
  List<StatusUpdate> get statuses => List.unmodifiable(_statuses);
  List<CallLog> get calls => List.unmodifiable(_calls);

  String get meName => _meName;
  void setMeName(String n) {
    _meName = n;
    notifyListeners();
  }

  Chat chatById(String id) => _chats.firstWhere((c) => c.id == id);

  /// Send a message — marks sent, then delivered, then read; triggers auto-reply.
  Future<void> sendMessage(String chatId, String text) async {
    final chatIndex = _chats.indexWhere((c) => c.id == chatId);
    if (chatIndex == -1) return;
    final chat = _chats[chatIndex];

    final msg = Message(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      text: text,
      time: DateTime.now(),
      isMe: true,
      status: MessageStatus.sent,
    );

    final updatedMessages = [...chat.messages, msg];
    _chats[chatIndex] = Chat(
      id: chat.id,
      name: chat.name,
      avatarEmoji: chat.avatarEmoji,
      avatarColor: chat.avatarColor,
      messages: updatedMessages,
      lastTime: msg.time,
      lastPreview: text,
      unreadCount: 0,
      online: chat.online,
      typing: false,
    );
    notifyListeners();

    // Simulate status progression.
    await Future.delayed(const Duration(milliseconds: 600));
    _updateMessageStatus(chatId, msg.id, MessageStatus.delivered);
    await Future.delayed(const Duration(milliseconds: 800));
    _updateMessageStatus(chatId, msg.id, MessageStatus.read);

    // Simulate a friend reply.
    await Future.delayed(const Duration(milliseconds: 1200));
    _receiveAutoReply(chatIndex);
  }

  void _updateMessageStatus(
      String chatId, String messageId, MessageStatus status) {
    final i = _chats.indexWhere((c) => c.id == chatId);
    if (i == -1) return;
    final chat = _chats[i];
    final updated = chat.messages
        .map((m) => m.id == messageId ? m.copyWith(status: status) : m)
        .toList();
    _chats[i] = Chat(
      id: chat.id,
      name: chat.name,
      avatarEmoji: chat.avatarEmoji,
      avatarColor: chat.avatarColor,
      messages: updated,
      lastTime: chat.lastTime,
      lastPreview: chat.lastPreview,
      unreadCount: chat.unreadCount,
      online: chat.online,
      typing: chat.typing,
    );
    notifyListeners();
  }

  void _receiveAutoReply(int chatIndex) {
    final chat = _chats[chatIndex];
    final reply = _pickReply(chat.name);
    final msg = Message(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      text: reply,
      time: DateTime.now(),
      isMe: false,
    );
    final updated = [...chat.messages, msg];
    _chats[chatIndex] = Chat(
      id: chat.id,
      name: chat.name,
      avatarEmoji: chat.avatarEmoji,
      avatarColor: chat.avatarColor,
      messages: updated,
      lastTime: msg.time,
      lastPreview: reply,
      unreadCount: chat.unreadCount + 1,
      online: chat.online,
      typing: false,
    );
    notifyListeners();
  }

  String _pickReply(String name) {
    final replies = [
      'Accha, bujhlam!',
      'Haha 😄',
      'Thik ache, kal bolchi.',
      'Are baba, tumi to expert!',
      'Ok noted 👍',
      'Eta to amazing!',
      'Bolo bolo, ami achi.',
      'One minute, call kori.',
      'Sends photo 📸',
      'Mishti kheyecho? 🍰',
    ];
    return replies[Random().nextInt(replies.length)];
  }

  void markRead(String chatId) {
    final i = _chats.indexWhere((c) => c.id == chatId);
    if (i == -1) return;
    final chat = _chats[i];
    if (chat.unreadCount == 0) return;
    _chats[i] = Chat(
      id: chat.id,
      name: chat.name,
      avatarEmoji: chat.avatarEmoji,
      avatarColor: chat.avatarColor,
      messages: chat.messages,
      lastTime: chat.lastTime,
      lastPreview: chat.lastPreview,
      unreadCount: 0,
      online: chat.online,
      typing: chat.typing,
    );
    notifyListeners();
  }

  void addStatus(StatusUpdate s) {
    _statuses.insert(1, s);
    notifyListeners();
  }
}
