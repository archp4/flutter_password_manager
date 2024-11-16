import 'package:flutter/material.dart';
import 'package:pwd_mng/helpers/database_helper.dart';
import 'package:pwd_mng/models/password_data.dart';

class PasswordHelper extends ChangeNotifier {
  List<PasswordData>? passwords;

  PasswordHelper() {
    getPasswords();
  }

  void getPasswords() async {
    passwords = await DatabaseHelper().getPasswords();
    notifyListeners();
  }

  void addPassword(PasswordData password) async {
    await DatabaseHelper().insertPassword(password);
    getPasswords();
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
