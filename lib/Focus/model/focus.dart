//@dart=2.9
import 'package:flutter/material.dart';

class FocusModel with ChangeNotifier {
  String id;
  String nameFocus;
  double factor;
  double ptsTotal;

  FocusModel({
    Key key,
    this.id,
    this.nameFocus,
    this.factor,
    this.ptsTotal,
  });

  set setPtsTotal(double ptsTotal) {
    this.ptsTotal = ptsTotal;
    notifyListeners();
  }
}
