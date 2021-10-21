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
    return Container(
        padding: EdgeInsets.only(right: 20.0),
        child: TextField(
          controller: controller,
          keyboardType: inputType,
          maxLines: maxLine,
          style: TextStyle(
              fontSize: 15.0,
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
