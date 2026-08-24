import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/call_log.dart';
import '../providers/chat_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/gradient_avatar.dart';

class CallsTab extends StatelessWidget {
  const CallsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final calls = context.watch<ChatProvider>().calls;
    return Container(
      color: Colors.white,
      child: ListView.separated(
        itemCount: calls.length,
        separatorBuilder: (_, __) =>
            const Divider(height: 1, indent: 78, color: Color(0xFFEEEEEE)),
        itemBuilder: (ctx, i) {
          final c = calls[i];
          return ListTile(
            leading: GradientAvatar(
                emoji: c.emoji, rgb: List<int>.from(c.color)),
            title: Text(c.name,
                style: const TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Row(
              children: [
                Icon(
                  c.type == CallType.missed
                      ? Icons.call_received
                      : c.type == CallType.outgoing
                          ? Icons.call_made
                          : Icons.call_received,
                  size: 16,
                  color: c.type == CallType.missed
                      ? AppColors.missedCall
                      : AppColors.tealGreen,
                ),
                const SizedBox(width: 6),
                Text(_timeText(c.time)),
              ],
            ),
            trailing: Icon(
              Icons.call,
              color: AppColors.tealGreen,
            ),
          );
        },
      ),
    );
  }

  String _timeText(DateTime t) {
    final now = DateTime.now();
    final diff = now.difference(t);
    if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
    if (diff.inHours < 24) {
      return DateFormat('HH:mm').format(t);
    }
    if (diff.inDays < 7) {
      return DateFormat('EEE, HH:mm').format(t);
    }
    return DateFormat('dd/MM/yyyy').format(t);
  }
}