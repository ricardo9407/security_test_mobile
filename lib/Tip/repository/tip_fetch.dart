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
      'https://run.mocky.io/v3/206fe9e8-5ab8-49d2-bb3d-5e1d2445573f';

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
