import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtil {
  // Save a string value in shared preferences
  static Future<void> setStringInPref(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  // Retrieve a string value from shared preferences
  static Future<String?> getStringFromPref(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  // Remove a value from shared preferences
  static Future<void> removeFromPref(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
