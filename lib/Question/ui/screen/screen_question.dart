//@dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/Focus/model/focus_list.dart';
import 'package:security_test_mobile/Question/model/question_list.dart';
import 'package:security_test_mobile/Question/ui/widget/header.dart';
import 'package:security_test_mobile/User/model/user.dart';
import 'package:security_test_mobile/User/ui/screen/finalScreen.dart';
import 'package:security_test_mobile/User/ui/screen/focusScore.dart';
import 'package:security_test_mobile/Widget/header-appbar.dart';

// ignore: must_be_immutable
class ScreenQuestion extends StatefulWidget {
  int index;
  double aux;
  List<double> ptss;

  ScreenQuestion({
    Key key,
    @required this.index,
    @required this.aux,
    @required this.ptss,
  });

  @override
  State<ScreenQuestion> createState() => _ScreenQuestionState();
}

class _ScreenQuestionState extends State<ScreenQuestion> {
  double character = 1;
  double pts = 0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final focus = Provider.of<FocusList>(context);
    final question = Provider.of<QuestionList>(context);
    var quest = question.getQuestion(widget.index);
    var focu = focus.getFocu(quest.idFocus);
    if (widget.index < 60) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Header(
                    index: widget.index,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Column(
                      children: <Widget>[
                        RadioListTile<double>(
                          title: const Text('Nunca'),
                          value: 1,
                          groupValue: character,
                          onChanged: (double value) {
                            setState(
                              () {
                                character = value;
                              },
                            );
                          },
                        ),
                        RadioListTile<double>(
                          title: const Text('Casi Nunca'),
                          value: 3,
                          groupValue: character,
                          onChanged: (double value) {
                            setState(
                              () {
                                character = value;
                              },
                            );
                          },
                        ),
                        RadioListTile<double>(
                          title: const Text('Casi Siempre'),
                          value: 5,
                          groupValue: character,
                          onChanged: (double value) {
                            setState(
                              () {
                                character = value;
                              },
                            );
                          },
                        ),
                        RadioListTile<double>(
                          title: const Text('Siempre'),
                          value: 7,
                          groupValue: character,
                          onChanged: (double value) {
                            setState(
                              () {
                                character = value;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10.0, right: 90.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: FloatingActionButton(
                            onPressed: () {
                              pts = character *
                                  quest.factorRespuesta *
                                  focu.factor;
                              widget.ptss.add(pts);
                              if (widget.index < 12) {
                                user.setPtsF1 = user.getPtsF1 + pts;
                              } else {
                                if (widget.index < 23) {
                                  user.setPtsF2 = user.getPtsF2 + pts;
                                } else {
                                  if (widget.index < 38) {
                                    user.setPtsF3 = user.getPtsF3 + pts;
                                  } else {
                                    if (widget.index < 54) {
                                      user.setPtsF4 = user.getPtsF4 + pts;
                                    } else {
                                      if (widget.index < 60) {
                                        user.setPtsF5 = user.getPtsF5 + pts;
                                      }
                                    }
                                  }
                                }
                              }
                              if (widget.index == 11 ||
                                  widget.index == 22 ||
                                  widget.index == 37 ||
                                  widget.index == 53) {
                                widget.index++;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FocusScore(
                                      id: focu.id,
                                      index: widget.index,
                                      aux: widget.aux,
                                      ptss: widget.ptss,
                                    ),
                                  ),
                                );
                              } else {
                                widget.index++;
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
                              }
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
                              widget.aux = widget.ptss[widget.ptss.length - 1];
                              widget.ptss.remove(widget.ptss.length - 1);
                              if (widget.index < 13) {
                                user.setPtsF1 = user.getPtsF1 - widget.aux;
                              } else {
                                if (widget.index < 24) {
                                  user.setPtsF2 = user.getPtsF2 - widget.aux;
                                } else {
                                  if (widget.index < 39) {
                                    user.setPtsF3 = user.getPtsF3 - widget.aux;
                                  } else {
                                    if (widget.index < 55) {
                                      user.setPtsF4 =
                                          user.getPtsF4 - widget.aux;
                                    } else {
                                      if (widget.index < 60) {
                                        user.setPtsF5 =
                                            user.getPtsF5 - widget.aux;
                                      }
                                    }
                                  }
                                }
                              }
                              if (widget.index == 0 ||
                                  widget.index == 12 ||
                                  widget.index == 23 ||
                                  widget.index == 38) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FocusScore(
                                      id: focu.id,
                                      index: widget.index,
                                      aux: widget.aux,
                                      ptss: widget.ptss,
                                    ),
                                  ),
                                );
                              } else {
                                widget.index--;
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
                              }
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
              HeaderAppBar(focus: focu)
            ],
          ),
        ),
      );
    } else {
      return FinalScreen();
    }
  }
}
