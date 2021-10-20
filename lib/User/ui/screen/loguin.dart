//@dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:security_test_mobile/User/model/user.dart';
import 'package:security_test_mobile/User/ui/screen/instructions.dart';
import 'package:security_test_mobile/Widget/gradient_back.dart';
import 'package:security_test_mobile/Widget/text_input.dart';
import 'package:security_test_mobile/Widget/title_header.dart';

class Loguin extends StatefulWidget {
  @override
  _Loguin createState() => _Loguin();
}

class _Loguin extends State<Loguin> {
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    bool _isValid = false;
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
                      controller: controllerEmail,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              FloatingActionButton(
                onPressed: () {
                  user.setUserName = controllerName.value.text;
                  user.setUserEmail = controllerEmail.value.text;
                  user.setPtsF1 = 0.0;
                  user.setPtsF2 = 0.0;
                  user.setPtsF3 = 0.0;
                  user.setPtsF4 = 0.0;
                  user.setPtsF5 = 0.0;
                  _isValid = EmailValidator.validate(user.getUserEmail);
                  if (user.getUserName.length > 4 && _isValid == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Instructions(),
                      ),
                    );
                  }
                },
                child: Icon(Icons.navigate_next),
                backgroundColor: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
