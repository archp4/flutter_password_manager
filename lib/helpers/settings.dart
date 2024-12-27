import 'package:flutter/material.dart';
import 'package:pwd_mng/helpers/preference_helper.dart';

class AppSettings extends ChangeNotifier {
  bool isDark = true;
  bool isAuth = true;

  AppSettings() {
    getAuthMode();
    getDarkMode();
  }

  getDarkMode() async {
    isDark = await PreferenceHelper.getDarkMode();
    notifyListeners();
  }

  getAuthMode() async {
    isAuth = await PreferenceHelper.getLocalAuth();
    debugPrint("Auth Status: $isAuth");
    notifyListeners();
  }

  updateDarkMode(bool value) async {
    await PreferenceHelper.setDarkMode(value);
    debugPrint("$value Updating");
    getDarkMode();
  }

  updateAuthMode(bool value) async {
    await PreferenceHelper.setLocalAuth(value);
    getAuthMode();
  }
}
