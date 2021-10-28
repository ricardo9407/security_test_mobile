//@dart=2.9
import 'package:flutter/material.dart';
import 'package:security_test_mobile/Tip/model/tip.dart';

class TipList with ChangeNotifier {
  List<TipModel> tips = [];

  TipList({
    Key key,
    this.tips,
  });

  List<TipModel> get getTips {
    return tips;
  }

  List<TipModel> getTip(String _id) {
    var aux;
    List<TipModel> aux2 = [];
    for (var i = 0; i < this.tips.length; i++) {
      if (this.tips[i].id == _id) {
        aux = this.tips[i];
        aux2.add(aux);
      }
    }
    return aux2;
  }

  set setTip(List<TipModel> tips) {
    this.tips = tips;
    notifyListeners();
  }
}
