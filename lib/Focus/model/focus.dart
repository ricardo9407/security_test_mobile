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

  double get getPts {
    return ptsTotal;
  }

  String get getNameFocus {
    return nameFocus;
  }

  double get getFactor {
    return factor;
  }

  set setPtsTotal(double ptsTotal) {
    this.ptsTotal = ptsTotal;
    notifyListeners();
  }

  factory FocusModel.fromJson(Map<String, dynamic> json) {
    return FocusModel(
      id: json['id'],
      nameFocus: json['nameFocus'],
      ptsTotal: json['ptsTotal'],
      factor: json['factor'],
    );
  }
}
