import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/chat_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/gradient_avatar.dart';
import 'chat_screen.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = context.watch<ChatProvider>().chats;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _StoriesRow(),
          const Divider(height: 1),
          Expanded(
            child: ListView.separated(
              itemCount: chats.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 78, color: Color(0xFFEEEEEE)),
              itemBuilder: (ctx, i) {
                final c = chats[i];
                final time = c.lastTime == null
                    ? ''
                    : DateFormat('HH:mm').format(c.lastTime!);
                return InkWell(
                  onTap: () {
                    context.read<ChatProvider>().markRead(c.id);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ChatScreen(chatId: c.id),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    child: Row(
                      children: [
                        GradientAvatar(
                            emoji: c.avatarEmoji, rgb: c.avatarColor),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      c.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    time,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: c.unreadCount > 0
                                          ? AppColors.tealGreen
                                          : Colors.grey,
                                      fontWeight: c.unreadCount > 0
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      c.typing ? 'typing...' : (c.lastPreview ?? ''),
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: c.typing
                                            ? AppColors.tealGreen
                                            : Colors.grey.shade700,
                                        fontStyle: c.typing
                                            ? FontStyle.italic
                                            : FontStyle.normal,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  if (c.unreadCount > 0)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 7, vertical: 3),
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF25D366),
                                            Color(0xFF128C7E),
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        '${c.unreadCount}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _StoriesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final statuses = context.watch<ChatProvider>().statuses;
    return Container(
      height: 96,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        itemCount: statuses.length,
        itemBuilder: (ctx, i) {
          final s = statuses[i];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              children: [
                GradientAvatar(
                  emoji: s.emoji,
                  rgb: s.color,
                  size: 52,
                  ring: i > 0 && !s.viewed,
                  cameraIcon: i == 0 ? Icons.add : null,
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: 70,
                  child: Text(
                    s.name,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}