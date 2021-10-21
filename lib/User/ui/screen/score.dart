//@dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/User/model/user.dart';
import 'package:security_test_mobile/Widget/gradient_back.dart';
import 'package:security_test_mobile/Widget/title_header.dart';

class Score extends StatefulWidget {
  @override
  _Score createState() => _Score();
}

class _Score extends State<Score> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    String nivel = ' ';
    String subNivel = ' ';
    double suma = user.getPtsF1 +
        user.getPtsF2 +
        user.getPtsF3 +
        user.getPtsF4 +
        user.getPtsF5;

    if (suma < 2.5) {
      nivel = 'Basico (Nivel 1)';
      if (suma < 1.945) {
        subNivel = "sub1";
      } else {
        if (suma >= 1.945 && suma < 1.975) {
          subNivel = "sub2";
        } else {
          if (suma > 1.975) {
            subNivel = "sub3";
          }
        }
      }
    } else {
      if (suma >= 2.5 && suma < 4) {
        nivel = 'Definido (Nivel 2)';
        if (suma < 2.995) {
          subNivel = "sub1";
        } else {
          if (suma >= 2.995 && suma < 3.475) {
            subNivel = "sub2";
          } else {
            if (suma > 3.475) {
              subNivel = "sub3";
            }
          }
        }
      } else {
        if (suma >= 4 && suma < 5.5) {
          nivel = 'Estable (Nivel 3)';
          if (suma < 4.495) {
            subNivel = "sub1";
          } else {
            if (suma >= 4.495 && suma < 4.975) {
              subNivel = "sub2";
            } else {
              if (suma > 4.975) {
                subNivel = "sub3";
              }
            }
          }
        } else {
          if (suma >= 5.5 && suma < 7) {
            nivel = 'Avanzado (Nivel 4)';
            if (suma < 5.995) {
              subNivel = "sub1";
            } else {
              if (suma >= 5.995 && suma < 6.475) {
                subNivel = "sub2";
              } else {
                if (suma > 6.475) {
                  subNivel = "sub3";
                }
              }
            }
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: TitleHeader(
                  title: 'Puntaje Total: ' + suma.toStringAsFixed(5),
                  tamanio: 30.0,
                  padding: EdgeInsets.only(top: 35.0, left: 40.0, right: 10.0),
                ),
              ),
              Flexible(
                child: TitleHeader(
                  title: 'Nivel: ' + nivel,
                  tamanio: 30.0,
                  padding: EdgeInsets.only(top: 35.0, left: 40.0, right: 10.0),
                ),
              ),
              Flexible(
                child: TitleHeader(
                  title: 'Sub-Nivel: ' + subNivel,
                  tamanio: 30.0,
                  padding: EdgeInsets.only(top: 35.0, left: 40.0, right: 10.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}