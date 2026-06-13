import 'package:flutter/material.dart';
class SettingScreen extends StatefulWidget {
  final String? pagename;
  const SettingScreen({super.key, this.pagename});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Settings'),),
      body: Center(
        child: Text(widget.pagename??'pagename')
      ),
    );
  }
}
