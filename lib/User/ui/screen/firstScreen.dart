//@dart=2.9

import 'package:flutter/material.dart';
import 'package:security_test_mobile/User/ui/widget/buildListUser.dart';
import 'package:security_test_mobile/Widget/gradient_back.dart';
import 'package:security_test_mobile/Widget/title_header.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreen createState() => _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(height: null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: TitleHeader(
                  title: "Bienvenido a Ciberseguridad",
                  tamanio: 40.0,
                  padding: EdgeInsets.only(top: 35.0, left: 40.0, right: 10.0),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              BuildListUser(),
            ],
          ),
        ],
      ),
    );
  }
}
