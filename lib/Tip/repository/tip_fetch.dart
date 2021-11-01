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
      'https://run.mocky.io/v3/b5cf2a93-5f27-45e5-be2b-6108a06d8b75';

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
