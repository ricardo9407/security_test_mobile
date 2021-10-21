//@dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/Question/model/question_list.dart';

class Header extends StatelessWidget {
  final int index;

  Header({
    Key key,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final question = Provider.of<QuestionList>(context);
    var quest = question.getQuestion(index);
    return Container(
      padding: EdgeInsets.only(top: 70.0, left: 30.0),
      child: Text(
        quest.id + '.' + '  ' + quest.header,
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: "Lato",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
