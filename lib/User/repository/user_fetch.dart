// @dart=2.9

import 'dart:async';
import 'package:mysql1/mysql1.dart';
import 'package:flutter/material.dart';
import 'package:security_test_mobile/User/model/user.dart';

String error;
List<UserModel> message = [];
List<UserModel> aux = [];

class UserFetch with ChangeNotifier {
  Future<List<UserModel>> fetchUser() async {
    final conn = await MySqlConnection.connect(
      ConnectionSettings(
          host: 'sql10.freemysqlhosting.net',
          port: 3306,
          user: 'sql10449221',
          db: 'sql10449221',
          password: 'm3s8lRTXE8'),
    );

    aux = listToASingleUser(await conn.query(
        'SELECT EM.Nombre as idOrg, admin, name, US.nivel, ptsF1, ptsF2, ptsF3, ptsF4, ptsF5, email, cargo, id FROM Usuario US INNER JOIN Empresa EM ON EM.ID_Empresa = US.idOrg'));
    conn.close();
    return aux;
  }

  void updateUser(UserModel us) async {
    String quer = 'UPDATE Usuario SET nivel = \'' +
        us.getNivel +
        '\', ptsF1 = \'' +
        us.getPtsF1.toString() +
        '\', ptsF2 = \'' +
        us.getPtsF2.toString() +
        '\', ptsF3 = \'' +
        us.getPtsF3.toString() +
        '\', ptsF4 = \'' +
        us.getPtsF4.toString() +
        '\', ptsF5 = \'' +
        us.getPtsF5.toString() +
        '\' where id = \'' +
        us.getId +
        '\'';

    print(quer);

    final conn = await MySqlConnection.connect(
      ConnectionSettings(
          host: 'sql10.freemysqlhosting.net',
          port: 3306,
          user: 'sql10449221',
          db: 'sql10449221',
          password: 'm3s8lRTXE8'),
    );
    await conn.query(quer);
    conn.close();
  }

  List<UserModel> listToASingleUser(listUser) {
    List<UserModel> aux = [];
    var message = listUser;
    message.forEach((user) {
      aux.add(UserModel(
        id: user['id'],
        name: user['name'],
        email: user['email'],
        cargo: user['cargo'],
        idOrg: user['idOrg'],
        admin: user['admin'],
        nivel: user['nivel'],
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
