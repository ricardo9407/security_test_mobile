//@dart=2.9

import 'package:flutter/material.dart';
import 'package:security_test_mobile/Company/model/company.dart';

class CompanyList with ChangeNotifier {
  List<CompanyModel> companies = [];

  CompanyList({
    Key key,
    this.companies,
  });

  List<CompanyModel> get getCompanies {
    return companies;
  }

  CompanyModel getcompany(String index) {
    var aux;
    for (var i = 0; i < this.companies.length; i++) {
      if (this.companies[i].id == index) {
        aux = this.companies[i];
      }
    }
    return aux;
  }

  set setCompanies(List<CompanyModel> company) {
    this.companies = company;
    notifyListeners();
  }
}
