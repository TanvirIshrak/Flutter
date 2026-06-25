import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../providers/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back)),
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: provider.isDarkMode,
            onChanged: (value) {
              provider.toggleDarkMode(value);
            },
          ),

          const Divider(),

          const ListTile(
            leading: Icon(Icons.info),
            title: Text("Version"),
            subtitle: Text("1.0.0"),
          ),

          const ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text("Contact"),
            subtitle: Text("ishrak@gmail.com"),
          ),
        ],
      ),
    );
  }
}