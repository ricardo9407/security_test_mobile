//@dart=2.9

import 'package:flutter/material.dart';
import 'package:security_test_mobile/Focus/model/focus.dart';

class FocusList with ChangeNotifier {
  List<FocusModel> focus = [];

  FocusList({
    Key key,
    this.focus,
  });

  List<FocusModel> get getFocus {
    return focus;
  }

  FocusModel getFocu(String index) {
    var aux;
    for (var i = 0; i < this.focus.length; i++) {
      if (this.focus[i].id == index) {
        aux = this.focus[i];
      }
    }
    return aux;
  }

  void setPuntos(String index, FocusModel aux) {
    for (var i = 0; i < this.focus.length; i++) {
      if (this.focus[i].id == index) {
        this.focus[i] = aux;
        //print(this.focus[i].ptsTotal);
      }
    }
    notifyListeners();
  }

  set setFocus(List<FocusModel> focus) {
    this.focus = focus;
    notifyListeners();
  }
}
