//@dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/Focus/model/focus_list.dart';
import 'package:security_test_mobile/Question/model/question_list.dart';
import 'package:security_test_mobile/User/model/user.dart';

class AnswersList extends StatefulWidget {
  int index;

  AnswersList({
    Key key,
    @required this.index,
  });

  _AnswersList createState() => _AnswersList();
}

class _AnswersList extends State<AnswersList> {
  double character = 0;
  double pts = 0;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final focus = Provider.of<FocusList>(context);
    final question = Provider.of<QuestionList>(context);
    var quest = question.getQuestion(widget.index);
    var focu = focus.getFocu(quest.idFocus);
    return Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Column(
        children: <Widget>[
          RadioListTile<double>(
            title: const Text('Nunca'),
            value: 1,
            groupValue: character,
            onChanged: (double value) {
              setState(() {
                character = value;
                pts = double.parse(
                    (character * quest.factorRespuesta * focu.factor)
                        .toStringAsFixed(5));
                if (widget.index < 13) {
                  user.setPtsF1 = user.getPtsF1 + pts;
                  print(user.getPtsF1);
                } else {
                  if (widget.index < 24) {
                    user.setPtsF2 = user.getPtsF2 + pts;
                    print(user.getPtsF2);
                  } else {
                    if (widget.index < 39) {
                      user.setPtsF3 = user.getPtsF3 + pts;
                      print(user.getPtsF3);
                    } else {
                      if (widget.index < 55) {
                        user.setPtsF4 = user.getPtsF4 + pts;
                        print(user.getPtsF4);
                      } else {
                        if (widget.index < 61) {
                          user.setPtsF5 = user.getPtsF5 + pts;
                          print(user.getPtsF5);
                        }
                      }
                    }
                  }
                }
              });
            },
          ),
          RadioListTile<double>(
            title: const Text('Casi Nunca'),
            value: 3,
            groupValue: character,
            onChanged: (double value) {
              setState(() {
                character = value;
                pts = double.parse(
                    (character * quest.factorRespuesta * focu.factor)
                        .toStringAsFixed(5));
                if (widget.index < 13) {
                  user.setPtsF1 = user.getPtsF1 + pts;
                  print(user.getPtsF1);
                } else {
                  if (widget.index < 24) {
                    user.setPtsF2 = user.getPtsF2 + pts;
                    print(user.getPtsF2);
                  } else {
                    if (widget.index < 39) {
                      user.setPtsF3 = user.getPtsF3 + pts;
                      print(user.getPtsF3);
                    } else {
                      if (widget.index < 55) {
                        user.setPtsF4 = user.getPtsF4 + pts;
                        print(user.getPtsF4);
                      } else {
                        if (widget.index < 61) {
                          user.setPtsF5 = user.getPtsF5 + pts;
                          print(user.getPtsF5);
                        }
                      }
                    }
                  }
                }
              });
            },
          ),
          RadioListTile<double>(
            title: const Text('Casi Siempre'),
            value: 5,
            groupValue: character,
            onChanged: (double value) {
              setState(() {
                character = value;
                pts = double.parse(
                    (character * quest.factorRespuesta * focu.factor)
                        .toStringAsFixed(5));
                if (widget.index < 13) {
                  user.setPtsF1 = user.getPtsF1 + pts;
                  print(user.getPtsF1);
                } else {
                  if (widget.index < 24) {
                    user.setPtsF2 = user.getPtsF2 + pts;
                    print(user.getPtsF2);
                  } else {
                    if (widget.index < 39) {
                      user.setPtsF3 = user.getPtsF3 + pts;
                      print(user.getPtsF3);
                    } else {
                      if (widget.index < 55) {
                        user.setPtsF4 = user.getPtsF4 + pts;
                        print(user.getPtsF4);
                      } else {
                        if (widget.index < 61) {
                          user.setPtsF5 = user.getPtsF5 + pts;
                          print(user.getPtsF5);
                        }
                      }
                    }
                  }
                }
              });
            },
          ),
          RadioListTile<double>(
            title: const Text('Siempre'),
            value: 7,
            groupValue: character,
            onChanged: (double value) {
              setState(() {
                character = value;
                pts = double.parse(
                    (character * quest.factorRespuesta * focu.factor)
                        .toStringAsFixed(5));
                if (widget.index < 13) {
                  user.setPtsF1 = user.getPtsF1 + pts;
                  print(user.getPtsF1);
                } else {
                  if (widget.index < 24) {
                    user.setPtsF2 = user.getPtsF2 + pts;
                    print(user.getPtsF2);
                  } else {
                    if (widget.index < 39) {
                      user.setPtsF3 = user.getPtsF3 + pts;
                      print(user.getPtsF3);
                    } else {
                      if (widget.index < 55) {
                        user.setPtsF4 = user.getPtsF4 + pts;
                        print(user.getPtsF4);
                      } else {
                        if (widget.index < 61) {
                          user.setPtsF5 = user.getPtsF5 + pts;
                          print(user.getPtsF5);
                        }
                      }
                    }
                  }
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
