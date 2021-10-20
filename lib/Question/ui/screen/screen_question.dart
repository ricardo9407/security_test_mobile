//@dart=2.9

import 'package:flutter/material.dart';
import 'package:security_test_mobile/Question/ui/widget/answersList.dart';
import 'package:security_test_mobile/Question/ui/widget/header.dart';
import 'package:security_test_mobile/User/ui/screen/instructions.dart';
import 'package:security_test_mobile/Widget/header-appbar.dart';

class ScreenQuestion extends StatelessWidget {
  int index;

  ScreenQuestion({
    Key key,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    if (index < 60) {
      return Scaffold(
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
                              )),
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
    } else {
      return Instructions();
    }
  }
}
