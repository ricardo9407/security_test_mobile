//@dart=2.9

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/Company/model/company_list.dart';
import 'package:security_test_mobile/Focus/model/focus_list.dart';
import 'package:security_test_mobile/Question/model/question_list.dart';
import 'package:security_test_mobile/Tip/model/tip_list.dart';
import 'package:security_test_mobile/User/model/user.dart';
import 'package:security_test_mobile/User/model/user_list.dart';
import 'package:security_test_mobile/User/ui/screen/firstScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => FocusList(),
        ),
        ChangeNotifierProvider(
          create: (_) => QuestionList(),
        ),
        ChangeNotifierProvider(
          create: (_) => TipList(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserList(),
        ),
        ChangeNotifierProvider(
          create: (_) => CompanyList(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Security Test',
      initialRoute: 'loguin',
      routes: {'loguin': (context) => FirstScreen()},
    );
  }
}
