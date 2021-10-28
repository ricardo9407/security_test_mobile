//@dart=2.9

import 'dart:async';

import 'package:security_test_mobile/Tip/model/tip.dart';
import 'package:security_test_mobile/Tip/repository/tip_fetch.dart';

class RepositoryTip {
  final _fetchTip = TipFetch();

  StreamController<List<TipModel>> _fetchTipController = StreamController();

  void fetchTip() async =>
      this._fetchTipController.add(await this._fetchTip.fetchTip());

  Stream<List<TipModel>> get getTipModel => this._fetchTipController.stream;

  void dispose() {
    _fetchTipController.close();
  }
}
