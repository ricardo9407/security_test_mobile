//@dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/User/model/user.dart';
import 'package:security_test_mobile/User/model/user_list.dart';
import 'package:security_test_mobile/User/repository/user_fetch.dart';
import 'package:security_test_mobile/Widget/gradient_back.dart';
import 'package:security_test_mobile/Widget/title_header.dart';

class FinalScreen extends StatefulWidget {
  @override
  _FinalScreen createState() => _FinalScreen();
}

class _FinalScreen extends State<FinalScreen> {
  final _userFetch = UserFetch();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    _userFetch.updateUser(user);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(height: null),
          Flexible(
            child: TitleHeader(
              title:
                  "Enhorabuena, has terminado de contestar el cuestionario. Gracias.",
              tamanio: 40.0,
              padding: EdgeInsets.only(top: 35.0, left: 40.0, right: 10.0),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
