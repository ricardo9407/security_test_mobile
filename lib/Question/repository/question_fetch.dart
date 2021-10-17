// @dart=2.9

import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:security_test_mobile/Question/model/question.dart';

List<QuestionModel> message = [];

class QuestionFetch {
  /*Future<List<QuestionModel>> fetchQuestion() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/questions.json");
    return listToASingleQuestion(json.decode(data));
  }*/

  List<QuestionModel> listToASingleQuestion(listQuestion) {
    List<QuestionModel> aux = [];
    var message = listQuestion;
    message.forEach((question) {
      aux.add(QuestionModel(
        id: question['id'],
        idFocus: question['idFocus'],
        header: question['header'],
        factorRespuesta: question['factorRespuesta'],
      ));
    });
    print(aux);
    return aux;
  }
}
