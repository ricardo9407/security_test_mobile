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

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(
        top: screenHeight * 0.1,
        left: screenWidth * 0.07,
      ),
      child: Text(
        quest.id + '.' + '  ' + quest.header,
        style: TextStyle(
          fontSize: screenHeight * 0.03,
          fontFamily: "Lato",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
