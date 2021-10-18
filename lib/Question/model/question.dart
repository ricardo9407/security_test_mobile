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
}
