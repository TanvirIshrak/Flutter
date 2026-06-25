import 'package:designing_3_layers_go_rought_provider/routers/app_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/settings_provider.dart';
// import 'routes/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final settingsProvider = SettingsProvider();
  await settingsProvider.loadSettings();

  runApp(
    ChangeNotifierProvider(
      create: (_) => settingsProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, provider, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode:
          provider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}