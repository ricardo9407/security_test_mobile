//@dart=2.9
import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  String id;
  String name;
  String email;
  String idOrg;
  String admin;
  String nivel;
  String subNivel;
  double ptsF1;
  double ptsF2;
  double ptsF3;
  double ptsF4;
  double ptsF5;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.idOrg,
    this.admin,
    this.nivel,
    this.subNivel,
    this.ptsF1,
    this.ptsF2,
    this.ptsF3,
    this.ptsF4,
    this.ptsF5,
  });

  String get getId {
    return id;
  }

  String get getUserName {
    return name;
  }

  String get getUserEmail {
    return email;
  }

  String get getIdOrg {
    return idOrg;
  }

  String get getAdmin {
    return admin;
  }

  String get getNivel {
    return nivel;
  }

  String get getSubNivel {
    return subNivel;
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

  set setId(String id) {
    this.id = id;
    notifyListeners();
  }

  set setUserName(String name) {
    this.name = name;
    notifyListeners();
  }

  set setUserEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  set setIdOrg(String idOrg) {
    this.idOrg = idOrg;
    notifyListeners();
  }

  set setAdmin(String admin) {
    this.admin = admin;
    notifyListeners();
  }

  set setNivel(String nivel) {
    this.nivel = nivel;
    notifyListeners();
  }

  set setSubNivel(String subNivel) {
    this.subNivel = subNivel;
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
