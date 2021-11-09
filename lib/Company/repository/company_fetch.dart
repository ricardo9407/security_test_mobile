// @dart=2.9

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:security_test_mobile/Company/model/company.dart';
import 'package:http/http.dart' show Client;

String error;
List<CompanyModel> message = [];

class CompanyFetch with ChangeNotifier {
  Client client = Client();

  final _baseUrl =
      'https://run.mocky.io/v3/781ff358-170f-4f59-a1f6-9601538d0963';

  Future<List<CompanyModel>> fetchCompany() async {
    final String url = _baseUrl;
    final response = await client.get(Uri.parse("$url"));
    if (response.statusCode == 200) {
      return listToASingleCompany(json.decode(response.body));
    } else {
      throw Exception('Failed to load Companies');
    }
  }

  List<CompanyModel> listToASingleCompany(listCompany) {
    List<CompanyModel> aux = [];
    var message = listCompany;
    message.forEach((company) {
      aux.add(CompanyModel(
        id: company['id'],
        name: company['name'],
      ));
    });
    return aux;
  }
}
