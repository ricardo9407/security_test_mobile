//@dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/Focus/model/focus.dart';
import 'package:security_test_mobile/Focus/model/focus_list.dart';
import 'package:security_test_mobile/Question/ui/screen/screen_question.dart';
import 'package:security_test_mobile/User/model/user.dart';
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
    final user = Provider.of<UserModel>(context);
    final focus = Provider.of<FocusList>(context);

    double suma;
    String num;
    FocusModel foc = focus.getFocu(widget.id);

    if (widget.index - 1 == 11) {
      suma = user.getPtsF1;
      num = 'Primer';
    } else {
      if (widget.index - 1 == 22) {
        suma = user.getPtsF2;
        num = 'Segundo';
      } else {
        if (widget.index - 1 == 37) {
          suma = user.getPtsF3;
          num = 'Tercero';
        } else {
          if (widget.index - 1 == 53) {
            suma = user.getPtsF4;
            num = 'Cuarto';
          } else {
            suma = user.getPtsF5;
            num = 'Quinto';
          }
        }
      }
    }

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
                    title: 'Has terminado el ' +
                        num +
                        ' Enfoque: ' +
                        foc.nameFocus,
                    tamanio: 30.0,
                    padding:
                        EdgeInsets.only(top: 35.0, left: 40.0, right: 10.0),
                  ),
                ),
                Flexible(
                  child: TitleHeader(
                    title: 'Tu puntaje en este enfoque es de: ' +
                        suma.toStringAsFixed(4),
                    tamanio: 30.0,
                    padding:
                        EdgeInsets.only(top: 35.0, left: 40.0, right: 10.0),
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
