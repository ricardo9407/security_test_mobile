//@dart=2.9
import 'package:flutter/material.dart';

class FocusModel with ChangeNotifier {
  String id;
  String nameFocus;
  double factor;

  FocusModel({
    Key key,
    this.id,
    this.nameFocus,
    this.factor,
  });
}
