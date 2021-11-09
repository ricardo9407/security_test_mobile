//@dart=2.9

import 'dart:async';

import 'package:security_test_mobile/Company/model/company.dart';
import 'package:security_test_mobile/Company/repository/company_fetch.dart';

class RepositoryCompany {
  final _fetchCompany = CompanyFetch();

  StreamController<List<CompanyModel>> _fetchCompanyController =
      StreamController();

  void fetchCompany() async =>
      this._fetchCompanyController.add(await this._fetchCompany.fetchCompany());

  Stream<List<CompanyModel>> get getCompanyModel =>
      this._fetchCompanyController.stream;

  void dispose() {
    _fetchCompanyController.close();
  }
}
