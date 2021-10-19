// @dart=2.9

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:security_test_mobile/Question/model/question.dart';
import 'package:http/http.dart' show Client;

String error;
List<QuestionModel> message = [];

class QuestionFetch with ChangeNotifier {
  Client client = Client();

  final _baseUrl =
      'https://run.mocky.io/v3/ccaf60e7-41c1-43a1-8481-a352d6e39545';

  Future<List<QuestionModel>> fetchQuestion() async {
    final String url = _baseUrl;
    final response = await client.get(Uri.parse("$url"));
    if (response.statusCode == 200) {
      return listToASingleQuestion(json.decode(response.body));
    } else {
      throw Exception('Failed to load Question');
    }
  }

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
    return aux;
  }
}
