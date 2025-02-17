import 'package:flutter/material.dart';
import 'package:pwd_mng/helpers/database_helper.dart';
import 'package:pwd_mng/models/custom_error.dart';
import 'package:pwd_mng/models/password_data.dart';

class PasswordHelper extends ChangeNotifier {
  List<PasswordData> passwords = [];

  PasswordHelper() {
    getPasswords();
  }

  void getPasswords() async {
    passwords = await DatabaseHelper().getPasswords();
    notifyListeners();
  }

  Future<void> addPassword(PasswordData password) async {
    try {
      for (var singlePassword in passwords) {
        if (password.title == singlePassword.title) {
          throw CustomError(
              message: "Password Already Exists, Try a Different Title");
        }
      }
      await DatabaseHelper().insertPassword(password);
      getPasswords();
    } catch (e) {
      rethrow;
    }
  }

  void removePassword(PasswordData password) async {
    await DatabaseHelper().deletePassword(password);
    getPasswords();
  }

  void updatePassword(PasswordData password) async {
    await DatabaseHelper().updatePassword(password);
    getPasswords();
  }
}
