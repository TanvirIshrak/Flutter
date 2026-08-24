import '../models/chat.dart';
import '../models/message.dart';
import '../models/status.dart';
import '../models/call_log.dart';

class DummyData {
  static List<Chat> getChats() {
    final now = DateTime.now();
    return [
      Chat(
        id: 'c1',
        name: 'Aarav Sharma',
        avatarEmoji: '🦁',
        avatarColor: const [255, 152, 0],
        online: true,
        unreadCount: 2,
        lastTime: now.subtract(const Duration(minutes: 2)),
        lastPreview: 'Kal milte hain bhai!',
        messages: [
          Message(
            id: 'm1',
            text: 'Hey, kemon achis?',
            time: now.subtract(const Duration(minutes: 12)),
            isMe: false,
          ),
          Message(
            id: 'm2',
            text: 'Bhalo, tumi bolo?',
            time: now.subtract(const Duration(minutes: 11)),
            isMe: true,
            status: MessageStatus.read,
          ),
          Message(
            id: 'm3',
            text: 'Kal milte hain bhai!',
            time: now.subtract(const Duration(minutes: 2)),
            isMe: false,
          ),
        ],
      ),
      Chat(
        id: 'c2',
        name: 'Priya Singh',
        avatarEmoji: '🌸',
        avatarColor: const [233, 30, 99],
        online: false,
        unreadCount: 0,
        lastTime: now.subtract(const Duration(hours: 1)),
        lastPreview: 'Project ta ready.',
        messages: [
          Message(
            id: 'm4',
            text: 'Project ta ready.',
            time: now.subtract(const Duration(hours: 1)),
            isMe: false,
          ),
        ],
      ),
      Chat(
        id: 'c3',
        name: 'Family Group 👨‍👩‍👧',
        avatarEmoji: '👨‍👩‍👧',
        avatarColor: const [156, 39, 176],
        online: true,
        unreadCount: 5,
        lastTime: now.subtract(const Duration(hours: 3)),
        lastPreview: 'Maa: Khichuri ranna hoyeche',
        messages: [
          Message(
            id: 'm5',
            text: 'Maa: Khichuri ranna hoyeche',
            time: now.subtract(const Duration(hours: 3)),
            isMe: false,
          ),
        ],
      ),
      Chat(
        id: 'c4',
        name: 'Rohit Verma',
        avatarEmoji: '⚡',
        avatarColor: const [33, 150, 243],
        online: true,
        typing: true,
        unreadCount: 0,
        lastTime: now.subtract(const Duration(minutes: 5)),
        lastPreview: 'typing...',
        messages: [
          Message(
            id: 'm6',
            text: 'Cricket khelle ja bachis?',
            time: now.subtract(const Duration(hours: 5)),
            isMe: false,
          ),
          Message(
            id: 'm7',
            text: 'Na, aj impossible.',
            time: now.subtract(const Duration(hours: 4)),
            isMe: true,
            status: MessageStatus.delivered,
          ),
        ],
      ),
      Chat(
        id: 'c5',
        name: 'Anjali Das',
        avatarEmoji: '🦋',
        avatarColor: const [0, 188, 212],
        online: false,
        unreadCount: 0,
        lastTime: now.subtract(const Duration(days: 1)),
        lastPreview: 'Good night 🌙',
        messages: [
          Message(
            id: 'm8',
            text: 'Good night 🌙',
            time: now.subtract(const Duration(days: 1)),
            isMe: false,
          ),
        ],
      ),
      Chat(
        id: 'c6',
        name: 'Boss (Office)',
        avatarEmoji: '💼',
        avatarColor: const [96, 125, 139],
        online: false,
        unreadCount: 1,
        lastTime: now.subtract(const Duration(days: 2)),
        lastPreview: 'Meeting at 10 AM sharp.',
        messages: [
          Message(
            id: 'm9',
            text: 'Meeting at 10 AM sharp.',
            time: now.subtract(const Duration(days: 2)),
            isMe: false,
          ),
        ],
      ),
      Chat(
        id: 'c7',
        name: 'Kabir Khan',
        avatarEmoji: '🎯',
        avatarColor: const [76, 175, 80],
        online: true,
        unreadCount: 0,
        lastTime: now.subtract(const Duration(days: 3)),
        lastPreview: 'Done bro 👍',
        messages: [
          Message(
            id: 'm10',
            text: 'Assignment complete?',
            time: now.subtract(const Duration(days: 3, hours: 1)),
            isMe: true,
            status: MessageStatus.read,
          ),
          Message(
            id: 'm11',
            text: 'Done bro 👍',
            time: now.subtract(const Duration(days: 3)),
            isMe: false,
          ),
        ],
      ),
    ];
  }

  static List<StatusUpdate> getStatuses() {
    final now = DateTime.now();
    return [
      StatusUpdate(
        id: 's_my',
        name: 'My status',
        emoji: '🙂',
        color: const [38, 50, 56],
        time: now,
      ),
      StatusUpdate(
        id: 's1',
        name: 'Aarav Sharma',
        emoji: '🦁',
        color: const [255, 152, 0],
        time: now.subtract(const Duration(minutes: 10)),
      ),
      StatusUpdate(
        id: 's2',
        name: 'Priya Singh',
        emoji: '🌸',
        color: const [233, 30, 99],
        time: now.subtract(const Duration(minutes: 35)),
      ),
      StatusUpdate(
        id: 's3',
        name: 'Rohit Verma',
        emoji: '⚡',
        color: const [33, 150, 243],
        time: now.subtract(const Duration(hours: 2)),
        viewed: true,
      ),
      StatusUpdate(
        id: 's4',
        name: 'Anjali Das',
        emoji: '🦋',
        color: const [0, 188, 212],
        time: now.subtract(const Duration(hours: 5)),
        viewed: true,
      ),
      StatusUpdate(
        id: 's5',
        name: 'Kabir Khan',
        emoji: '🎯',
        color: const [76, 175, 80],
        time: now.subtract(const Duration(hours: 12)),
        viewed: true,
      ),
    ];
  }

  static List<CallLog> getCalls() {
    final now = DateTime.now();
    return [
      CallLog(
        id: 'cl1',
        name: 'Aarav Sharma',
        emoji: '🦁',
        color: const [255, 152, 0],
        time: now.subtract(const Duration(minutes: 20)),
        type: CallType.incoming,
      ),
      CallLog(
        id: 'cl2',
        name: 'Priya Singh',
        emoji: '🌸',
        color: const [233, 30, 99],
        time: now.subtract(const Duration(hours: 2)),
        type: CallType.outgoing,
      ),
      CallLog(
        id: 'cl3',
        name: 'Boss (Office)',
        emoji: '💼',
        color: const [96, 125, 139],
        time: now.subtract(const Duration(hours: 5)),
        type: CallType.missed,
      ),
      CallLog(
        id: 'cl4',
        name: 'Rohit Verma',
        emoji: '⚡',
        color: const [33, 150, 243],
        time: now.subtract(const Duration(days: 1)),
        type: CallType.incoming,
      ),
      CallLog(
        id: 'cl5',
        name: 'Maa',
        emoji: '🌺',
        color: const [156, 39, 176],
        time: now.subtract(const Duration(days: 1, hours: 3)),
        type: CallType.outgoing,
      ),
      CallLog(
        id: 'cl6',
        name: 'Kabir Khan',
        emoji: '🎯',
        color: const [76, 175, 80],
        time: now.subtract(const Duration(days: 2)),
        type: CallType.missed,
      ),
    ];
  }
}
