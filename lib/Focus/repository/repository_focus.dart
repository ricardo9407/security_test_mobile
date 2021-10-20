//@dart=2.9

//import 'dart:async';

import 'dart:async';

import 'package:security_test_mobile/Focus/model/focus.dart';
import 'package:security_test_mobile/Focus/repository/focus_fetch.dart';

class RepositoryFocus {
  final _fetchFocus = FocusFetch();

  StreamController<List<FocusModel>> _fetchFocusController = StreamController();

  void fetchFocus() async =>
      this._fetchFocusController.add(await this._fetchFocus.fetchFocus());

  Stream<List<FocusModel>> get getFocusModel =>
      this._fetchFocusController.stream;

  void dispose() {
    _fetchFocusController.close();
  }
}
