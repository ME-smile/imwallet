import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

enum SpKey {
  token,
  refreshToken,
}

abstract class SpUtil {
  static late SharedPreferences _prefs;
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> remove(SpKey key) => _prefs.remove(key.name);

  static String? getString(SpKey key) => _prefs.getString(key.name);

  static Map? getJson(SpKey key) {
    final String? jsonString = _prefs.getString(key.name);
    if (jsonString == null) return null;
    return jsonDecode(jsonString);
  }

  static Future<bool> setJson(SpKey key, Map data) =>
      _prefs.setString(key.name, jsonEncode(data));
}
