import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static String darkMode = "LockItTheme";
  static String localAuth = "LockItLocalAuth";
  static String onBoardingAuth = "onBoarding";

  static Future<void> setDarkMode(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(darkMode, value);
  }

  static Future<void> setLocalAuth(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(localAuth, value);
  }

  static Future<void> setOnBoarding(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(onBoardingAuth, value);
  }

  static Future<bool> getOnBoarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(onBoardingAuth) ?? false;
  }

  static Future<bool> getDarkMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(darkMode) ?? false;
  }

  static Future<bool> getLocalAuth() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(localAuth) ?? false;
  }
}
