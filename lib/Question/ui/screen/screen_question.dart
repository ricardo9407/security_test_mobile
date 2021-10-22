//@dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/Focus/model/focus_list.dart';
import 'package:security_test_mobile/Question/model/question_list.dart';
import 'package:security_test_mobile/Question/ui/widget/header.dart';
import 'package:security_test_mobile/User/model/user.dart';
import 'package:security_test_mobile/User/ui/screen/focusScore.dart';
import 'package:security_test_mobile/User/ui/screen/score.dart';
import 'package:security_test_mobile/Widget/header-appbar.dart';

// ignore: must_be_immutable
class ScreenQuestion extends StatefulWidget {
  int index;

  ScreenQuestion({
    Key key,
    @required this.index,
  });

  @override
  State<ScreenQuestion> createState() => _ScreenQuestionState();
}

class _ScreenQuestionState extends State<ScreenQuestion> {
  double character = 0;
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
                  FloatingActionButton(
                    onPressed: () {
                      pts = character * quest.factorRespuesta * focu.factor;
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
                            ),
                          ),
                        );
                      }
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
      return Score();
    }
  }
}
