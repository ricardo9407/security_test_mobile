//@dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/Focus/model/focus_list.dart';
import 'package:security_test_mobile/Focus/repository/repository_focus.dart';
import 'package:security_test_mobile/Question/model/question_list.dart';
import 'package:security_test_mobile/Question/repository/repository_question.dart';
import 'package:security_test_mobile/User/model/user.dart';
import 'package:security_test_mobile/User/ui/screen/loguin.dart';

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
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final frep = RepositoryFocus();
  final qrep = RepositoryQuestion();
  @override
  Widget build(BuildContext context) {
    frep.fetchFocus();
    qrep.fetchQuestion();
    return MaterialApp(
      title: 'Security Test',
      initialRoute: 'loguin',
      routes: {'loguin': (context) => Loguin()},
    );
  }
}
