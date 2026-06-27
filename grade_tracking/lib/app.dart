import 'package:flutter/material.dart';
import 'package:grade_tracking/screens/add_subject_screen.dart';
import 'package:provider/provider.dart';

import 'theme/app_themes.dart';
import 'ui/home_shell.dart';

class GradeTrackingApp extends StatelessWidget {
  const GradeTrackingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeController>(
      builder: (context, themeCtrl, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme(),
          darkTheme: AppThemes.darkTheme(),
          themeMode: themeCtrl.themeMode,
          home: const AddSubjectScreen(),
        );
      },
    );
  }
}
