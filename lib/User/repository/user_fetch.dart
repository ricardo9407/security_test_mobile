// @dart=2.9

import 'dart:async';
import 'dart:convert';
import 'package:mysql1/mysql1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:security_test_mobile/User/model/user.dart';

String error;
List<UserModel> message = [];

class UserFetch with ChangeNotifier {
  Client client = Client();

  //final _baseUrl =
  //  'https://run.mocky.io/v3/7a235db9-795e-4ca5-85f0-5e5711016929';

  Future<List<UserModel>> fetchUser() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
        host: 'sql10.freemysqlhosting.net',
        port: 3306,
        user: 'sql10449221',
        db: 'sql10449221',
        password: 'm3s8lRTXE8'));

    return listToASingleUser(await conn.query(
        'SELECT EM.Nombre as idOrg, name, US.nivel, ptsF1, ptsF2, ptsF3, ptsF4, ptsF5, email, id FROM Usuario US INNER JOIN Empresa EM ON EM.ID_Empresa = US.idOrg'));

    /* final String url = _baseUrl;
    final response = await client.get(Uri.parse("$url"));
    if (response.statusCode == 200) {
      return listToASingleUser(json.decode(response.body));
    } else {
      throw Exception('Failed to load Tips');
    }*/
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
