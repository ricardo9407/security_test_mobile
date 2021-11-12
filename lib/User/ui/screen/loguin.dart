//@dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/User/model/user.dart';
import 'package:security_test_mobile/User/model/user_list.dart';
import 'package:security_test_mobile/User/ui/screen/instructions.dart';
import 'package:security_test_mobile/User/ui/screen/score.dart';
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

  var aux = UserModel();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final users = Provider.of<UserList>(context);

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
              Container(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.07,
                    left: screenWidth * 0.07,
                    right: screenWidth * 0.07),
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
                      height: screenHeight * 0.007,
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
                height: screenHeight * 0.07,
              ),
              FloatingActionButton(
                onPressed: () {
                  aux = users.getUser(
                      controllerName.value.text, controllerEmail.value.text);
                  if (aux != null) {
                    user.setId = aux.id;
                    user.setUserName = aux.name;
                    user.setUserEmail = aux.email;
                    user.setIdOrg = aux.idOrg;
                    user.setAdmin = aux.admin;
                    user.setNivel = ' ';
                    user.setPtsF1 = 0.0;
                    user.setPtsF2 = 0.0;
                    user.setPtsF3 = 0.0;
                    user.setPtsF4 = 0.0;
                    user.setPtsF5 = 0.0;
                    if (user.getAdmin == 'false') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Instructions(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Score(),
                        ),
                      );
                    }
                  } else {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Usuario no valido."),
                        content: Text(
                            "El usuario o correo ingresado no son validos."),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Aceptar'),
                          ),
                        ],
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
