import 'package:designing_3_layers_go_rought_provider/services/preferences_services.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  Future<void> loadSettings() async{
    _isDarkMode = await PreferencesServices.getDarkMode();
    notifyListeners();
  }

  Future<void> toggleDarkMode(bool value) async{
    _isDarkMode = value;

    await PreferencesServices.saveDarkMode(value);
    notifyListeners();
  }

}