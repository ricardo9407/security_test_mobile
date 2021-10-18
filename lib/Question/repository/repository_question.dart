//@dart=2.9

import 'package:security_test_mobile/Question/model/question.dart';
import 'package:security_test_mobile/Question/repository/question_fetch.dart';

class RepositoryQuestion {
  final _fetchQuestion = QuestionFetch();

  List<QuestionModel> _fetchQuestionController;

  void fetchQuestion() async =>
      this._fetchQuestionController = await this._fetchQuestion.fetchQuestion();

  List<QuestionModel> get getQuestionModel => this._fetchQuestionController;
}
