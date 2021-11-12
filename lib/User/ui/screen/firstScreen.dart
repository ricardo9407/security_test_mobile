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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
                  title: "Bienvenido a SeguriApp",
                  tamanio: screenHeight * 0.05,
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.05, right: screenWidth * 0.02),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.07,
              ),
              BuildListUser(),
            ],
          ),
        ],
      ),
    );
  }
}
