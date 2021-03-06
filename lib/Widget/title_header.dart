//@dart=2.9

import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final String title;
  final EdgeInsets padding;
  final double tamanio;
  final Color color;
  TitleHeader({
    Key key,
    @required this.title,
    @required this.tamanio,
    @required this.padding,
    @required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        child: Text(title,
            style: TextStyle(
                color: color, //Colors.white,
                fontSize: tamanio,
                fontFamily: "Lato",
                fontWeight: FontWeight.bold)));
  }
}
