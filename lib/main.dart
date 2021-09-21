import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/User/model/user.dart';
import 'package:security_test_mobile/User/ui/screen/loguin.dart';
import 'Question/model/question.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuestionModel(
            0,
            '¿Pregunta?',
            0.4,
            0.25,
          ),
        ),
        ChangeNotifierProvider(create: (_) => UserModel('', '')),
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
      routes: {'loguin': (context) => Loguin()},
    );
  }
}
