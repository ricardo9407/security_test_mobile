//@dart=2.9
import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  String name;
  String email;

  UserModel({
    this.name,
    this.email,
  });

  String get getUserName {
    return name;
  }

  String get getUserEmail {
    return email;
  }

  set setUserName(String name) {
    this.name = name;
    notifyListeners();
  }

  set setUserEmail(String email) {
    this.email = email;
    notifyListeners();
  }
}
