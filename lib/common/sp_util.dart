// Author: Dean.Liu
// DateTime: 2023/01/11 10:47

import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences?> setup() async {
    return _prefs = await SharedPreferences.getInstance();
  }

  /// get bool.
  static bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  /// get bool value.
  static bool getBoolValue(String key, {bool defaultValue = false}) {
    return _prefs?.getBool(key) ?? defaultValue;
  }

  /// put bool.
  static Future<bool>? putBool(String key, bool value) {
    return _prefs?.setBool(key, value);
  }

  /// contains Key.
  static bool? containsKey(String key) {
    return _prefs?.containsKey(key);
  }

  /// get keys.
  static Set<String>? getKeys() {
    return _prefs?.getKeys();
  }

  /// remove.
  static Future<bool>? remove(String key) {
    return _prefs?.remove(key);
  }

  /// clear.
  static Future<bool>? clear() {
    return _prefs?.clear();
  }

  /// Fetches the latest values from the host platform.
  static Future<void>? reload() {
    return _prefs?.reload();
  }

  ///Sp is initialized.
  static bool isInitialized() {
    return _prefs != null;
  }

  /// get Sp.
  static SharedPreferences? getSp() {
    return _prefs;
  }
}
