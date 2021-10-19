//@dart=2.9

import 'dart:async';

import 'package:security_test_mobile/Question/model/question.dart';
import 'package:security_test_mobile/Question/repository/question_fetch.dart';

class RepositoryQuestion {
  final _fetchQuestion = QuestionFetch();

  StreamController<List<QuestionModel>> _fetchQuestionController =
      StreamController();

  void fetchQuestion() async => this
      ._fetchQuestionController
      .add(await this._fetchQuestion.fetchQuestion());

  Stream<List<QuestionModel>> get getQuestionModel =>
      this._fetchQuestionController.stream;

  void dispose() {
    _fetchQuestionController.close();
  }
}
