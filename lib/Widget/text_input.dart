//@dart=2.9

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextInput extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;

  int maxLine = 1;

  TextInput({
    Key key,
    @required this.hintText,
    @required this.inputType,
    @required this.controller,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        padding: EdgeInsets.only(right: screenWidth * 0.05),
        child: TextField(
          controller: controller,
          keyboardType: inputType,
          maxLines: maxLine,
          style: TextStyle(
              fontSize: screenHeight * 0.02,
              fontFamily: "Lato",
              color: Colors.black,
              fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFe5e5e5),
              border: InputBorder.none,
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                  borderRadius: BorderRadius.all(Radius.circular(9.0))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                  borderRadius: BorderRadius.all(Radius.circular(9.0)))),
        ));
  }
}
