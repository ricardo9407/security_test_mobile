//@dart=2.9

import 'package:flutter/material.dart';
import 'package:security_test_mobile/Question/model/question.dart';

class FocusModel with ChangeNotifier {
  String id;
  String nameFocus;
  double ptsTotal;
  double factor;
  QuestionModel preguntas;

  FocusModel({
    this.id,
    this.nameFocus,
    this.ptsTotal,
    this.factor,
    this.preguntas,
  });

  double get getPts {
    return ptsTotal;
  }

  String get getNameFocus {
    return nameFocus;
  }

  double get getFactor {
    return factor;
  }

  QuestionModel get getPreguntas {
    return preguntas;
  }

  set setPtsTotal(double ptsTotal) {
    this.ptsTotal = ptsTotal;
    notifyListeners();
  }

  set setNameFocus(String nameFocus) {
    this.nameFocus = nameFocus;
    notifyListeners();
  }

  set setFactor(double factor) {
    this.factor = factor;
    notifyListeners();
  }

  factory FocusModel.fromJson(Map<String, dynamic> json) {
    return FocusModel(
      nameFocus: json['nameFocus'],
      ptsTotal: json['ptsTotal'],
      factor: json['factor'],
      preguntas: QuestionModel.fromJson(json['commune']),
    );
  }
}
