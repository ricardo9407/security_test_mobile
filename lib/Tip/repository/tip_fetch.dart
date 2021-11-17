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
      'https://run.mocky.io/v3/a6df1cb9-ba3a-4ed4-8724-fbd3a2ba1c1e';
  //'https://run.mocky.io/v3/41484906-04a6-4dc9-9e0b-59f2328135ea';
  //'https://run.mocky.io/v3/b5cf2a93-5f27-45e5-be2b-6108a06d8b75';

  Future<List<TipModel>> fetchTip() async {
    final String url = _baseUrl;
    final response = await client.get(Uri.parse("$url"));
    if (response.statusCode == 200) {
      return listToASingleTip(json.decode(response.body));
    } else {
      throw Exception('Failed to load Tips');
    }
  }

  List<TipModel> listToASingleTip(listTip) {
    List<TipModel> aux = [];
    var message = listTip;
    message.forEach((tip) {
      aux.add(TipModel(
        id: tip['id'],
        tip: tip['consejo'],
      ));
    });
    return aux;
  }
}
