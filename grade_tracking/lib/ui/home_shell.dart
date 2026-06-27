import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/add_subject_screen.dart';
import '../screens/subject_list_screen.dart';
import '../screens/summary_screen.dart';

class HomeShell extends StatelessWidget {
  const HomeShell({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Grade Tracking'),
          actions: [
            Consumer<ThemeModeController>(
              builder: (context, themeCtrl, _) {
                return IconButton(
                  onPressed: themeCtrl.toggle,
                  icon: Icon(
                    themeCtrl.isDark ? Icons.dark_mode : Icons.light_mode,
                    color: theme.colorScheme.onPrimary,
                  ),
                );
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.add), text: 'Add'),
              Tab(icon: Icon(Icons.list), text: 'List'),
              Tab(icon: Icon(Icons.summarize), text: 'Summary'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [AddSubjectScreen(), SubjectListScreen(), SummaryScreen()],
        ),
      ),
    );
  }
}

// Controls theme.
class ThemeModeController extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;

  void toggle() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
