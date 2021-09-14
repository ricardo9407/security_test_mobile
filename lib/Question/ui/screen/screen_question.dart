import 'package:flutter/material.dart';
import 'package:security_test_mobile/Question/ui/widget/answersList.dart';
import 'package:security_test_mobile/Question/ui/widget/header.dart';
import 'package:security_test_mobile/Widget/header-appbar.dart';

class ScreenQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              SizedBox(height: 50.0),
              Header(),
              AnswersList(),
              SizedBox(
                height: 70.0,
                width: 200,
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScreenQuestion()),
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
    );
  }
}
