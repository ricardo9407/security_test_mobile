// @dart=2.9

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:security_test_mobile/Focus/model/focus.dart';
import 'package:http/http.dart' show Client;

String error;
List<FocusModel> message = [];

class FocusFetch with ChangeNotifier {
  Client client = Client();

  final _baseUrl =
      'https://run.mocky.io/v3/d6d1f6d3-7804-4381-907f-fc3517138ace';

  Future<List<FocusModel>> fetchFocus() async {
    final String url = _baseUrl;
    final response = await client.get(Uri.parse("$url"));
    if (response.statusCode == 200) {
      return listToASingleFocus(json.decode(response.body));
    } else {
      throw Exception('Failed to load Focus');
    }
  }

  List<FocusModel> listToASingleFocus(listFocus) {
    List<FocusModel> aux = [];
    var message = listFocus;
    message.forEach((focus) {
      aux.add(FocusModel(
        id: focus['id'],
        nameFocus: focus['nameFocus'],
        factor: focus['factor'],
      ));
    });
    return aux;
  }
}
