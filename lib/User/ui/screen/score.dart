//@dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/Tip/ui/widget/buildListTip.dart';
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

    String id = ' ';
    String nivel = ' ';
    String subNivel = ' ';
    double suma = user.getPtsF1 +
        user.getPtsF2 +
        user.getPtsF3 +
        user.getPtsF4 +
        user.getPtsF5;

    if (suma < 2.5) {
      nivel = 'Cofre (Nivel 1)';
      if (suma < 1.945) {
        subNivel = "sub1";
        id = "1.1";
      } else {
        if (suma >= 1.945 && suma < 1.975) {
          subNivel = "sub2";
          id = "1.2";
        } else {
          if (suma > 1.975) {
            subNivel = "sub3";
            id = "1.3";
          }
        }
      }
    } else {
      if (suma >= 2.5 && suma < 4) {
        nivel = 'Caja Fuerte (Nivel 2)';
        if (suma < 2.995) {
          subNivel = "sub1";
          id = "2.1";
        } else {
          if (suma >= 2.995 && suma < 3.475) {
            subNivel = "sub2";
            id = "2.2";
          } else {
            if (suma > 3.475) {
              subNivel = "sub3";
              id = "2.3";
            }
          }
        }
      } else {
        if (suma >= 4 && suma < 5.5) {
          nivel = 'Bobeda (Nivel 3)';
          if (suma < 4.495) {
            subNivel = "sub1";
            id = "3.1";
          } else {
            if (suma >= 4.495 && suma < 4.975) {
              subNivel = "sub2";
              id = "3.2";
            } else {
              if (suma > 4.975) {
                subNivel = "sub3";
                id = "3.3";
              }
            }
          }
        } else {
          if (suma >= 5.5 && suma < 7) {
            nivel = 'Bunker (Nivel 4)';
            if (suma < 5.995) {
              subNivel = "sub1";
              id = "4.1";
            } else {
              if (suma >= 5.995 && suma < 6.475) {
                subNivel = "sub2";
                id = "4.2";
              } else {
                if (suma > 6.475) {
                  subNivel = "sub3";
                  id = "4.3";
                }
              }
            }
          }
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4268D3),
        title: Text('Puntos'),
      ),
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
                  padding: EdgeInsets.only(left: 20.0, right: 10.0),
                ),
              ),
              Flexible(
                child: TitleHeader(
                  title: 'Nivel: ' + nivel,
                  tamanio: 30.0,
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 10.0),
                ),
              ),
              Flexible(
                child: TitleHeader(
                  title: 'Sub-Nivel: ' + subNivel,
                  tamanio: 30.0,
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 10.0),
                ),
              ),
              Flexible(
                child: TitleHeader(
                  title: 'Puntaje Enfoque 1: ' +
                      user.getPtsF1.toStringAsFixed(4) +
                      '/0.7 (' +
                      ((user.getPtsF1 / 0.7) * 100).toStringAsFixed(1) +
                      ' )',
                  tamanio: 20.0,
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 10.0),
                ),
              ),
              Flexible(
                child: TitleHeader(
                  title: 'Puntaje Enfoque 2: ' +
                      user.getPtsF2.toStringAsFixed(4) +
                      '/1.37 (' +
                      ((user.getPtsF2 / 1.4) * 100).toStringAsFixed(1) +
                      ' )',
                  tamanio: 20.0,
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 10.0),
                ),
              ),
              Flexible(
                child: TitleHeader(
                  title: 'Puntaje Enfoque 3: ' +
                      user.getPtsF3.toStringAsFixed(4) +
                      '/1.74 (' +
                      ((user.getPtsF3 / 1.75) * 100).toStringAsFixed(1) +
                      ' )',
                  tamanio: 20.0,
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 10.0),
                ),
              ),
              Flexible(
                child: TitleHeader(
                  title: 'Puntaje Enfoque 4: ' +
                      user.getPtsF4.toStringAsFixed(4) +
                      '/2.09 (' +
                      ((user.getPtsF4 / 2.1) * 100).toStringAsFixed(1) +
                      ' )',
                  tamanio: 20.0,
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 10.0),
                ),
              ),
              Flexible(
                child: TitleHeader(
                  title: 'Puntaje Enfoque 5: ' +
                      user.getPtsF5.toStringAsFixed(4) +
                      '/1.05 (' +
                      ((user.getPtsF5 / 1.05) * 100).toStringAsFixed(1) +
                      ' )',
                  tamanio: 20.0,
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 10.0),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              BuildListTip(id: id),
            ],
          ),
        ],
      ),
    );
  }
}
