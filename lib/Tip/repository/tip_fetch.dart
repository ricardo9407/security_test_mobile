// @dart=2.9

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:security_test_mobile/Tip/model/tip.dart';
import 'package:http/http.dart' show Client;

String error;
List<TipModel> message = [];

class TipFetch with ChangeNotifier {
  Client client = Client();

  final _baseUrl =
      'https://run.mocky.io/v3/91b1fb1a-01f1-4b8e-b208-d839d59b8c9a';

  Future<List<TipModel>> fetchTip() async {
    final String url = _baseUrl;
    final response = await client.get(Uri.parse("$url"));
    if (response.statusCode == 200) {
      return listToASingleQuestion(json.decode(response.body));
    } else {
      throw Exception('Failed to load Tips');
    }
  }

  List<TipModel> listToASingleQuestion(listQuestion) {
    List<TipModel> aux = [];
    var message = listQuestion;
    message.forEach((question) {
      aux.add(TipModel(
        id: question['id'],
        tip: question['consejo'],
      ));
    });
    return aux;
  }
}
