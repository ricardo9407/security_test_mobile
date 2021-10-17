//@dart=2.9
import 'package:flutter/material.dart';

class QuestionModel with ChangeNotifier {
  String id;
  String idFocus;
  String header;
  double factorRespuesta;

  QuestionModel({
    Key key,
    this.id,
    this.idFocus,
    this.header,
    this.factorRespuesta,
  });

  String get getId {
    return id;
  }

  String get getIdFocus {
    return idFocus;
  }

  String get getHeader {
    return header;
  }

  double get getFactorRespuesta {
    return factorRespuesta;
  }

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      idFocus: json['idFocus'],
      header: json['header'],
      factorRespuesta: json['factorRespuesta'],
    );
  }
}
