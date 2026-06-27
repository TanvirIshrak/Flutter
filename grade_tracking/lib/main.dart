import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'state/subject_provider.dart';
import 'ui/home_shell.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SubjectProvider()),
        ChangeNotifierProvider(create: (_) => ThemeModeController()),
      ],
      child: const GradeTrackingApp(),
    ),
  );
}
