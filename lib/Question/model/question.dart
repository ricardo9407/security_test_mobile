import 'package:flutter/material.dart';

class QuestionModel with ChangeNotifier {
  double _pts;
  String _header;
  double _factor;
  double _factor2;

  QuestionModel(
    this._pts,
    this._header,
    this._factor,
    this._factor2,
  );

  double get getPts {
    return _pts;
  }

  String get getHeader {
    return _header;
  }

  double get getFactor {
    return _factor;
  }

  double get getFactor2 {
    return _factor2;
  }

  set setPts(double pts) {
    this._pts = pts;
    notifyListeners();
  }

  set setHeader(String header) {
    this._header = header;
    notifyListeners();
  }

  set setFactor(double factor) {
    this._factor = factor;
    notifyListeners();
  }

  set setFactor2(double factor2) {
    this._factor2 = factor2;
    notifyListeners();
  }
}
