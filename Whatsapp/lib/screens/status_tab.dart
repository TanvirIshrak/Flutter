import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/chat_provider.dart';
import '../widgets/gradient_avatar.dart';

class StatusTab extends StatelessWidget {
  const StatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    final statuses = context.watch<ChatProvider>().statuses;

    final recent = statuses.sublist(1).where((s) => !s.viewed).toList();
    final viewed = statuses.sublist(1).where((s) => s.viewed).toList();

    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          ListTile(
            leading: GradientAvatar(
              emoji: statuses[0].emoji,
              rgb: statuses[0].color,
              ring: true,
              cameraIcon: Icons.add,
            ),
            title: const Text('My status',
                style: TextStyle(fontWeight: FontWeight.w600)),
            subtitle: const Text('Tap to add status update'),
          ),
          if (recent.isNotEmpty) ...[
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 6),
              child: Text('Recent updates',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600)),
            ),
            ...recent.map((s) => _StatusTile(s: s)),
          ],
          if (viewed.isNotEmpty) ...[
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 6),
              child: Text('Viewed updates',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600)),
            ),
            ...viewed.map((s) => _StatusTile(s: s)),
          ],
        ],
      ),
    );
  }
}

class _StatusTile extends StatelessWidget {
  final dynamic s;
  const _StatusTile({required this.s});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GradientAvatar(
        emoji: s.emoji,
        rgb: List<int>.from(s.color),
        ring: !s.viewed,
      ),
      title: Text(s.name,
          style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(DateFormat('HH:mm').format(s.time)),
    );
  }
}