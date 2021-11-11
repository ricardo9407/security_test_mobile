//@dart=2.9
import 'package:flutter/material.dart';

class CompanyModel {
  String id;
  String name;
  String address;
  String phone;

  CompanyModel({
    Key key,
    this.id,
    this.name,
    this.address,
    this.phone,
  });
}
