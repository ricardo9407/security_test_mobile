//@dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/User/model/user.dart';
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

    double total = 0;
    String nivel = '';

    total = user.getPtsF1 +
        user.getPtsF2 +
        user.getPtsF3 +
        user.getPtsF4 +
        user.getPtsF5;

    if (total < 2.5) {
      nivel = 'Cofre (Nivel 1)';
    } else {
      if (total >= 2.5 && total < 4) {
        nivel = 'Caja Fuerte (Nivel 2)';
      } else {
        if (total >= 4 && total < 5.5) {
          nivel = 'Bobeda (Nivel 3)';
        } else {
          if (total >= 5.5 && total < 7) {
            nivel = 'Bunker (Nivel 4)';
          }
        }
      }
    }

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(height: null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: TitleHeader(
                  title:
                      "Enhorabuena, has terminado de contestar el cuestionario. Gracias.",
                  tamanio: 40.0,
                  padding: EdgeInsets.only(top: 35.0, left: 40.0, right: 10.0),
                  color: Colors.white,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  user.setNivel = nivel;
                  _userFetch.updateUser(user);
                  SystemNavigator.pop();
                },
                child: Icon(Icons.navigate_next),
                backgroundColor: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
