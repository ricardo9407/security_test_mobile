import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/Question/model/question.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final question = Provider.of<QuestionModel>(context);
    return Container(
      padding: EdgeInsets.only(top: 70.0, left: 30.0),
      child: Text(
        question.getHeader,
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: "Lato",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
