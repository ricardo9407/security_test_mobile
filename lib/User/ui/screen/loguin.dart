//@dart=2.9

import 'package:flutter/material.dart';
import 'package:security_test_mobile/Widget/buildfocus.dart';
import 'package:security_test_mobile/Widget/gradient_back.dart';
import 'package:security_test_mobile/Widget/text_input.dart';
import 'package:security_test_mobile/Widget/title_header.dart';

class Loguin extends StatefulWidget {
  @override
  _Loguin createState() => _Loguin();
}

class _Loguin extends State<Loguin> {
  final controllerName = TextEditingController();
  final controlleremail = TextEditingController();

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
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 50.0, left: 30.0, right: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextInput(
                      hintText: "Name",
                      inputType: null,
                      maxLine: 1,
                      controller: controllerName,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextInput(
                      hintText: "Email",
                      inputType: null,
                      maxLine: 1,
                      controller: controlleremail,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              BuildFocus(
                name: controllerName.value.text,
                email: controlleremail.value.text,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
