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

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
                    tamanio: screenHeight * 0.04,
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.05,
                      left: screenWidth * 0.1,
                      right: screenWidth * 0.02,
                    ),
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.07,
                ),
                buildButton(context, widget.index, widget.aux, widget.ptss)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildButton(
    BuildContext context, int index, double aux, List<double> ptss) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (index != 0) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: screenWidth * 0.02,
            right: screenWidth * 0.2,
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenQuestion(
                      index: index,
                      aux: aux,
                      ptss: ptss,
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
          padding: EdgeInsets.only(
            left: screenWidth * 0.2,
            right: screenWidth * 0.02,
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
              onPressed: () {
                if (index == 12 || index == 23 || index == 38 || index == 54) {
                  index--;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenQuestion(
                      index: index,
                      aux: aux,
                      ptss: ptss,
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
    );
  } else {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScreenQuestion(
                index: index,
                aux: aux,
                ptss: ptss,
              ),
            ),
          );
        },
        child: Icon(Icons.navigate_next),
        backgroundColor: Colors.lightBlue,
        heroTag: null,
      ),
    );
  }
}
