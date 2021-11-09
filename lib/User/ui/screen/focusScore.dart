//@dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/Focus/model/focus.dart';
import 'package:security_test_mobile/Focus/model/focus_list.dart';
import 'package:security_test_mobile/Question/ui/screen/screen_question.dart';
import 'package:security_test_mobile/Widget/gradient_back.dart';
import 'package:security_test_mobile/Widget/title_header.dart';

// ignore: must_be_immutable
class FocusScore extends StatefulWidget {
  int index;
  String id;

  FocusScore({
    Key key,
    @required this.index,
    @required this.id,
  });

  @override
  _FocusScore createState() => _FocusScore();
}

class _FocusScore extends State<FocusScore> {
  @override
  Widget build(BuildContext context) {
    final focus = Provider.of<FocusList>(context);

    FocusModel foc = focus.getFocu(widget.id);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            GradientBack(height: null),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: TitleHeader(
                    title: 'Vas a empezar el Enfoque: ' + foc.nameFocus,
                    tamanio: 30.0,
                    padding:
                        EdgeInsets.only(top: 35.0, left: 40.0, right: 10.0),
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Center(
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ScreenQuestion(index: widget.index),
                        ),
                      );
                    },
                    child: Icon(Icons.navigate_next),
                    backgroundColor: Colors.lightBlue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
