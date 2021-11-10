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

  FocusModel getFocu(int index) {
    var aux;
    for (var i = 0; i < this.focus.length; i++) {
      if (this.focus[i].id == index) {
        aux = this.focus[i];
      }
    }
    return aux;
  }

  set setFocus(List<FocusModel> focus) {
    this.focus = focus;
    notifyListeners();
  }
}
