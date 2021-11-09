//@dart=2.9

import 'package:flutter/material.dart';
import 'package:security_test_mobile/Widget/gradient_back.dart';
import 'package:security_test_mobile/Widget/title_header.dart';

class FinalScreen extends StatefulWidget {
  @override
  _FinalScreen createState() => _FinalScreen();
}

class _FinalScreen extends State<FinalScreen> {
  @override
  Widget build(BuildContext context) {
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
