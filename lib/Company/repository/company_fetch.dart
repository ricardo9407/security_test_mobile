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
      'https://run.mocky.io/v3/e27fefc3-768e-4fd9-bf5a-4ebcbc073faa';

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
        address: company['address'],
        phone: company['phone'],
      ));
    });
    return aux;
  }
}
