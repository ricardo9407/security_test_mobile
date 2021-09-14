import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  late String _name = 'nombre';
  late String _email = 'email';

  String get getUserName {
    return _name;
  }

  String get getUserEmail {
    return _email;
  }

  set setUserName(String name) {
    this._name = name;
    notifyListeners();
  }

  set setUserEmail(String email) {
    this._email = email;
    notifyListeners();
  }
}
