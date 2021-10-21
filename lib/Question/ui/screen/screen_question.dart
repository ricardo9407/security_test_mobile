//@dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/Question/ui/widget/answersList.dart';
import 'package:security_test_mobile/Question/ui/widget/header.dart';
import 'package:security_test_mobile/User/model/user.dart';
import 'package:security_test_mobile/Widget/header-appbar.dart';

// ignore: must_be_immutable
class ScreenQuestion extends StatelessWidget {
  int index;

  ScreenQuestion({
    Key key,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    if (index < 60) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Header(
                    index: index,
                  ),
                  AnswersList(
                    index: index,
                  ),
                  SizedBox(
                    height: 70.0,
                    width: 200,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      index++;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenQuestion(
                            index: index,
                          ),
                        ),
                      );
                    },
                    child: Icon(Icons.navigate_next),
                    backgroundColor: Colors.lightBlue,
                  ),
                ],
              ),
              HeaderAppBar()
            ],
          ),
        ),
      );
    } else {
      print('Puntaje Primer Enfoque:');
      print(user.getPtsF1);
      print('Puntaje Segundo Enfoque:');
      print(user.getPtsF2);
      print('Puntaje Tercer Enfoque:');
      print(user.getPtsF3);
      print('Puntaje Cuarto Enfoque:');
      print(user.getPtsF4);
      print('Puntaje Quinto Enfoque:');
      print(user.getPtsF5);
      print('Puntaje Total:');
      print(user.getPtsF1 +
          user.getPtsF2 +
          user.getPtsF3 +
          user.getPtsF4 +
          user.getPtsF5);
    }
  }
}
