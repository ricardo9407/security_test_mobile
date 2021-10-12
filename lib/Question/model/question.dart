//@dart=2.9
import 'package:flutter/material.dart';

class QuestionModel with ChangeNotifier {
  double ptsRespuesta;
  String header;
  double factorRespuesta;

  QuestionModel({
    this.ptsRespuesta,
    this.header,
    this.factorRespuesta,
  });

  double get getPts {
    return ptsRespuesta;
  }

  String get getHeader {
    return header;
  }

  double get getFactorRespuesta {
    return factorRespuesta;
  }

  set setPtsRespuesta(double ptsRespuesta) {
    this.ptsRespuesta = ptsRespuesta;
    notifyListeners();
  }

  set setHeader(String header) {
    this.header = header;
    notifyListeners();
  }

  set setFactorRespuesta(double factorRespuesta) {
    this.factorRespuesta = factorRespuesta;
    notifyListeners();
  }

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      ptsRespuesta: json['ptsRespuesta'],
      header: json['header'],
      factorRespuesta: json['factorRespuesta'],
    );
  }
}
