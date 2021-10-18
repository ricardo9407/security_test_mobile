//@dart=2.9

//import 'dart:async';

import 'package:security_test_mobile/Focus/model/focus.dart';
import 'package:security_test_mobile/Focus/repository/focus_fetch.dart';

class RepositoryFocus {
  final _fetchFocus = FocusFetch();

  List<FocusModel> _fetchFocusController;

  void fetchFocus() async =>
      this._fetchFocusController = await this._fetchFocus.fetchFocus();

  List<FocusModel> get getFocusModel => this._fetchFocusController;
}
