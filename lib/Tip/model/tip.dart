//@dart=2.9
import 'package:flutter/material.dart';

class TipModel with ChangeNotifier {
  String id;
  String tip;

  TipModel({
    Key key,
    this.id,
    this.tip,
  });
}
