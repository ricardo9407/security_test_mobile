//@dart=2.9

import 'package:flutter/material.dart';
import 'package:security_test_mobile/Widget/title_header.dart';

import 'gradient_back.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      GradientBack(height: 80.0),
      TitleHeader(
          title: "Preguntas",
          tamanio: 30.0,
          padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 10.0)),
    ]);
  }
}
