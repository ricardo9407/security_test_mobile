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

  List<UserModel> getUsersCompany(String _idOrg) {
    var aux;
    List<UserModel> aux2 = [];
    for (var i = 0; i < this.users.length; i++) {
      if (this.users[i].idOrg == _idOrg && this.users[i].admin == 'false') {
        aux = this.users[i];
        aux2.add(aux);
      }
    }
    return aux2;
  }

  set setUsers(List<UserModel> user) {
    this.users = user;
    notifyListeners();
  }
}
