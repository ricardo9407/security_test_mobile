// @dart=2.9

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:security_test_mobile/User/model/user.dart';

String error;
List<UserModel> message = [];

class UserFetch with ChangeNotifier {
  Client client = Client();

  final _baseUrl =
      'https://run.mocky.io/v3/7a235db9-795e-4ca5-85f0-5e5711016929';

  Future<List<UserModel>> fetchUser() async {
    final String url = _baseUrl;
    final response = await client.get(Uri.parse("$url"));
    if (response.statusCode == 200) {
      return listToASingleUser(json.decode(response.body));
    } else {
      throw Exception('Failed to load Tips');
    }
  }

  List<UserModel> listToASingleUser(listUser) {
    List<UserModel> aux = [];
    var message = listUser;
    message.forEach((user) {
      aux.add(UserModel(
        id: user['id'],
        name: user['name'],
        email: user['email'],
        idOrg: user['idOrg'],
        admin: user['admin'],
        nivel: user['nivel'],
        subNivel: user['subNivel'],
        ptsF1: user['ptsF1'],
        ptsF2: user['ptsF2'],
        ptsF3: user['ptsF3'],
        ptsF4: user['ptsF4'],
        ptsF5: user['ptsF5'],
      ));
    });
    return aux;
  }
}
