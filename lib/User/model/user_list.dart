//@dart=2.9

import 'package:flutter/material.dart';
import 'package:security_test_mobile/User/model/user.dart';

class UserList with ChangeNotifier {
  List<UserModel> users = [];

  UserList({
    Key key,
    this.users,
  });

  List<UserModel> get getUsers {
    return users;
  }

  UserModel getUser(String name, String email) {
    for (var i = 0; i < this.users.length; i++) {
      if (this.users[i].name == name && this.users[i].email == email) {
        return this.users[i];
      }
    }
    return null;
  }

  List<UserModel> getUserss(String _idOrg, String _id) {
    var aux;
    List<UserModel> aux2 = [];
    for (var i = 0; i < this.users.length / 3; i++) {
      if (this.users[i].idOrg == _idOrg && this.users[i].id != _id) {
        aux = this.users[i];
        aux2.add(aux);
      }
    }
    return aux2;
  }

/*
  void modifyUser(UserModel user) {
    for (var i = 0; i < this.users.length; i++) {
      if (this.users[i].id == user.id) {
        this.users[i].ptsF1 = user.ptsF1;
        this.users[i].ptsF2 = user.ptsF2;
        this.users[i].ptsF3 = user.ptsF3;
        this.users[i].ptsF4 = user.ptsF4;
        this.users[i].ptsF5 = user.ptsF5;
      }
    }
  }
*/
  set setUsers(List<UserModel> user) {
    this.users = user;
    notifyListeners();
  }
}
