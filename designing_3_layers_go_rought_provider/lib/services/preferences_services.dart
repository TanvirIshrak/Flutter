import 'package:shared_preferences/shared_preferences.dart';

class PreferencesServices {
  static const String darkModeKey = 'darkMode';

  static Future<bool> getDarkMode() async{
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(darkModeKey) ?? false;
  }

  static Future<void> saveDarkMode(bool value) async{
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(darkModeKey, value);
  }
}