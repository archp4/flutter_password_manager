import 'package:pwd_mng/models/password_data.dart';

class Manager {
  List<PasswordData> _list = [];

  List<PasswordData> getData() {
    return _list;
  }

  bool addPassword({required PasswordData newData}) {
    try {
      _list.add(newData);
    } catch (e) {
      return false;
    }
    return true;
  }

  bool removePassword({required PasswordData data}) {
    try {
      _list.remove(data);
    } catch (e) {
      return false;
    }
    return true;
  }

  bool updatePassword(
      {required PasswordData oldData, required PasswordData newData}) {
    try {
      _list.remove(oldData);
      _list.add(newData);
    } catch (e) {
      return false;
    }
    return true;
  }
}
