import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/chat_provider.dart';
import '../widgets/gradient_app_bar.dart';
import 'chats_tab.dart';
import 'status_tab.dart';
import 'calls_tab.dart';
import 'community_tab.dart';

class HomeScreen extends StatefulWidget {
  final String meName;
  const HomeScreen({super.key, required this.meName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatProvider>().setMeName(widget.meName);
    });
  }

  final _tabs = const [
    ChatsTab(),
    StatusTab(),
    CallsTab(),
    CommunityTab(),
  ];

  final _titles = ['WhatsApp', 'Status', 'Calls', 'Communities'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: _titles[_index],
        actions: _index == 0
            ? [
                IconButton(
                    icon: const Icon(Icons.camera_alt_outlined),
                    onPressed: () {}),
                IconButton(icon: const Icon(Icons.search), onPressed: () {}),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert),
                  onSelected: (v) {},
                  itemBuilder: (_) => const [
                    PopupMenuItem(value: 'new', child: Text('New group')),
                    PopupMenuItem(value: 'profile', child: Text('Profile')),
                    PopupMenuItem(value: 'settings', child: Text('Settings')),
                  ],
                ),
              ]
            : _index == 1
                ? [
                    IconButton(icon: const Icon(Icons.search), onPressed: () {}),
                    IconButton(
                        icon: const Icon(Icons.more_vert), onPressed: () {}),
                  ]
                : _index == 2
                    ? [
                        IconButton(
                            icon: const Icon(Icons.search), onPressed: () {}),
                        IconButton(
                            icon: const Icon(Icons.more_vert), onPressed: () {}),
                      ]
                    : [
                        IconButton(
                            icon: const Icon(Icons.search), onPressed: () {}),
                        IconButton(
                            icon: const Icon(Icons.more_vert), onPressed: () {}),
                      ],
      ),
      body: _tabs[_index],
      floatingActionButton: _buildFab(_index),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF075E54), Color(0xFF128C7E)],
          ),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, -2))
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white60,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline), label: 'Chats'),
            BottomNavigationBarItem(
                icon: Icon(Icons.circle_outlined), label: 'Status'),
            BottomNavigationBarItem(icon: Icon(Icons.call_outlined), label: 'Calls'),
            BottomNavigationBarItem(
                icon: Icon(Icons.groups_outlined), label: 'Communities'),
          ],
        ),
      ),
    );
  }

  Widget? _buildFab(int i) {
    switch (i) {
      case 0:
        return FloatingActionButton(
          backgroundColor: const Color(0xFF25D366),
          onPressed: () {},
          child: const Icon(Icons.chat, color: Colors.white),
        );
      case 1:
        return FloatingActionButton(
          backgroundColor: const Color(0xFF25D366),
          onPressed: () {},
          child: const Icon(Icons.camera_alt, color: Colors.white),
        );
      case 2:
        return FloatingActionButton(
          backgroundColor: const Color(0xFF25D366),
          onPressed: () {},
          child: const Icon(Icons.add_call, color: Colors.white),
        );
      default:
        return null;
    }
  }
}