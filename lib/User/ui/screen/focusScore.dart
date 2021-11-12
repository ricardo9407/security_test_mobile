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
  int id;
  double aux;
  List<double> ptss;

  FocusScore({
    Key key,
    @required this.index,
    @required this.id,
    @required this.aux,
    @required this.ptss,
  });

  @override
  _FocusScore createState() => _FocusScore();
}

class _FocusScore extends State<FocusScore> {
  @override
  Widget build(BuildContext context) {
    final focus = Provider.of<FocusList>(context);

    FocusModel foc = focus.getFocu(widget.id + 1);

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
                    title: 'Vas a empezar el Enfoque ' +
                        (widget.id + 1).toString() +
                        ': ' +
                        foc.nameFocus,
                    tamanio: 30.0,
                    padding:
                        EdgeInsets.only(top: 35.0, left: 40.0, right: 10.0),
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10.0, right: 90.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScreenQuestion(
                                  index: widget.index,
                                  aux: widget.aux,
                                  ptss: widget.ptss,
                                ),
                              ),
                            );
                          },
                          child: Icon(Icons.navigate_next),
                          backgroundColor: Colors.lightBlue,
                          heroTag: null,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 90.0, right: 10.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: FloatingActionButton(
                          onPressed: () {
                            if (widget.index == 12 ||
                                widget.index == 23 ||
                                widget.index == 38 ||
                                widget.index == 54) {
                              widget.index--;
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScreenQuestion(
                                  index: widget.index,
                                  aux: widget.aux,
                                  ptss: widget.ptss,
                                ),
                              ),
                            );
                          },
                          child: Icon(Icons.navigate_before),
                          backgroundColor: Colors.lightBlue,
                          heroTag: null,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenQuestion(
                            index: widget.index,
                            aux: widget.aux,
                          ),
                        ),
                      );*/