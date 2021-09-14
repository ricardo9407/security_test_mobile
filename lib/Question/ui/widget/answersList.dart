import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/Question/model/question.dart';

class AnswersList extends StatefulWidget {
  _AnswersList createState() => _AnswersList();
}

class _AnswersList extends State<AnswersList> {
  double? character;
  @override
  Widget build(BuildContext context) {
    final question = Provider.of<QuestionModel>(context);
    return Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Column(
        children: <Widget>[
          RadioListTile<double>(
            title: const Text('Nunca'),
            value: 1,
            groupValue: character,
            onChanged: (double? value) {
              setState(() {
                character = value;
                question.setPts = question.getPts +
                    (character! * (question.getFactor * question.getFactor2));
              });
            },
          ),
          RadioListTile<double>(
            title: const Text('Casi Nunca'),
            value: 3,
            groupValue: character,
            onChanged: (double? value) {
              setState(() {
                character = value;
                question.setPts = question.getPts +
                    (character! * (question.getFactor * question.getFactor2));
              });
            },
          ),
          RadioListTile<double>(
            title: const Text('Casi Siempre'),
            value: 5,
            groupValue: character,
            onChanged: (double? value) {
              setState(() {
                character = value;
                question.setPts = question.getPts +
                    (character! * (question.getFactor * question.getFactor2));
              });
            },
          ),
          RadioListTile<double>(
            title: const Text('Siempre'),
            value: 7,
            groupValue: character,
            onChanged: (double? value) {
              setState(() {
                character = value;
                question.setPts = question.getPts +
                    (character! * (question.getFactor * question.getFactor2));
              });
            },
          ),
        ],
      ),
    );
  }
}
