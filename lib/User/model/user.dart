//@dart=2.9
import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  String name;
  String email;
  double ptsF1;
  double ptsF2;
  double ptsF3;
  double ptsF4;
  double ptsF5;

  UserModel({
    this.name,
    this.email,
    this.ptsF1,
    this.ptsF2,
    this.ptsF3,
    this.ptsF4,
    this.ptsF5,
  });

  String get getUserName {
    return name;
  }

  String get getUserEmail {
    return email;
  }

  double get getPtsF1 {
    return ptsF1;
  }

  double get getPtsF2 {
    return ptsF2;
  }

  double get getPtsF3 {
    return ptsF3;
  }

  double get getPtsF4 {
    return ptsF4;
  }

  double get getPtsF5 {
    return ptsF5;
  }

  set setUserName(String name) {
    this.name = name;
    notifyListeners();
  }

  set setUserEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  set setPtsF1(double pts) {
    this.ptsF1 = pts;
    notifyListeners();
  }

  set setPtsF2(double pts) {
    this.ptsF2 = pts;
    notifyListeners();
  }

  set setPtsF3(double pts) {
    this.ptsF3 = pts;
    notifyListeners();
  }

  set setPtsF4(double pts) {
    this.ptsF4 = pts;
    notifyListeners();
  }

  set setPtsF5(double pts) {
    this.ptsF5 = pts;
    notifyListeners();
  }
}
