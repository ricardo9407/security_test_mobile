//@dart=2.9

import 'package:flutter/material.dart';
import 'package:security_test_mobile/Question/model/question.dart';

class QuestionList with ChangeNotifier {
  List<QuestionModel> questions = [];

  QuestionList({
    Key key,
    this.questions,
  });

  List<QuestionModel> get getQuestions {
    return questions;
  }

  QuestionModel getQuestion(int index) {
    var aux;
    for (var i = 0; i < this.questions.length; i++) {
      if (i == index) {
        aux = this.questions[i];
      }
    }
    return aux;
  }

  set setQuestions(List<QuestionModel> questions) {
    this.questions = questions;
    notifyListeners();
  }
}
