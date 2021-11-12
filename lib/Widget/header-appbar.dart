//@dart=2.9

import 'package:flutter/material.dart';
import 'package:security_test_mobile/Focus/model/focus.dart';
import 'package:security_test_mobile/Widget/title_header.dart';

import 'gradient_back.dart';

class HeaderAppBar extends StatelessWidget {
  final FocusModel focus;

  HeaderAppBar({
    Key key,
    this.focus,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(children: <Widget>[
      GradientBack(height: screenHeight * 0.12),
      TitleHeader(
        title: focus.nameFocus,
        tamanio: screenHeight * 0.03,
        padding: EdgeInsets.only(
          top: screenHeight * 0.05,
          left: screenWidth * 0.05,
          right: screenWidth * 0.02,
        ),
        color: Colors.white,
      ),
    ]);
  }
}
