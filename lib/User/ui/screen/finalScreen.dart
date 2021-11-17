//@dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/Tip/ui/widget/buildListTip.dart';
import 'package:security_test_mobile/User/model/user.dart';
import 'package:security_test_mobile/Widget/gradient_back.dart';
import 'package:security_test_mobile/Widget/title_header.dart';

class FinalScreen extends StatefulWidget {
  @override
  _FinalScreen createState() => _FinalScreen();
}

class _FinalScreen extends State<FinalScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double total = 0;
    String nivel = ' ';

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
                  tamanio: screenHeight * 0.06,
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.05,
                    left: screenWidth * 0.1,
                    right: screenWidth * 0.02,
                  ),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.07,
              ),
              BuildListTip(id: "5", boolean: true, nivel: nivel),
            ],
          ),
        ],
      ),
    );
  }
}
