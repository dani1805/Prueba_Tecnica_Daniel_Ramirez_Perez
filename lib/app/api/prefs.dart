// ignore_for_file: lines_longer_than_80_chars, constant_identifier_names, avoid_positional_boolean_parameters

import 'package:shared_preferences/shared_preferences.dart';

enum EnumPrefs { TOKEN }

class Prefs {
  static Future<String> getStringValue(EnumPrefs key) async =>
      (await _prefs).getString(key.toString()) ?? '';
  static Future<bool> setStringValue(String value, EnumPrefs key) async {
    return (await _prefs).setString(key.toString(), value);
  }

  static Future<bool> getBoolValue(EnumPrefs key) async =>
      (await _prefs).getBool(key.toString()) ?? false;
  static Future<bool> setBoolValue(bool value, EnumPrefs key) async {
    return (await _prefs).setBool(key.toString(), value);
  }

  static Future<int> getIntValue(EnumPrefs key) async =>
      (await _prefs).getInt(key.toString()) ?? 0;
  static Future<bool> setIntValue(int value, EnumPrefs key) async {
    return (await _prefs).setInt(key.toString(), value);
  }

  static Future<double> getDoubleValue(EnumPrefs key) async =>
      (await _prefs).getDouble(key.toString()) ?? 0;
  static Future<bool> setDoubleValue(double value, EnumPrefs key) async {
    return (await _prefs).setDouble(key.toString(), value);
  }
}

Future<SharedPreferences> get _prefs async => SharedPreferences.getInstance();
