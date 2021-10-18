//@dart=2.9

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 70.0, left: 30.0),
      child: Text(
        'Hola',
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: "Lato",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
