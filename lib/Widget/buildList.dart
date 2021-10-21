//@dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/Focus/model/focus.dart';
import 'package:security_test_mobile/Focus/model/focus_list.dart';
import 'package:security_test_mobile/Focus/repository/repository_focus.dart';
import 'package:security_test_mobile/Question/model/question.dart';
import 'package:security_test_mobile/Question/model/question_list.dart';
import 'package:security_test_mobile/Question/repository/repository_question.dart';
import 'package:security_test_mobile/Question/ui/screen/screen_question.dart';

class BuildList extends StatefulWidget {
  @override
  State<BuildList> createState() => _BuildList();
}

class _BuildList extends State<BuildList> {
  final frep = RepositoryFocus();
  final qrep = RepositoryQuestion();

  List<FocusModel> focusList = [];
  List<QuestionModel> questionList = [];

  @override
  Widget build(BuildContext context) {
    final focus = Provider.of<FocusList>(context);
    final question = Provider.of<QuestionList>(context);

    frep.fetchFocus();
    qrep.fetchQuestion();

    return Center(
      child: StreamBuilder(
          stream: frep.getFocusModel,
          builder: (_, AsyncSnapshot<List<FocusModel>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.none:
                return CircularProgressIndicator();
              case ConnectionState.active:
                if (snapshot.data != null) {
                  return buildListFocus(
                      snapshot.data, question, focus, context);
                }
                return CircularProgressIndicator();
              case ConnectionState.done:
                if (snapshot.data != null) {
                  return buildListFocus(
                      snapshot.data, question, focus, context);
                }
                return CircularProgressIndicator();
              default:
                if (snapshot.data != null) {
                  return buildListFocus(
                      snapshot.data, question, focus, context);
                }
                return CircularProgressIndicator();
            }
          }),
    );
  }

  Widget buildListFocus(List<FocusModel> focus, QuestionList question,
      FocusList focu, BuildContext context) {
    FocusModel fo;
    for (var i = 0; i < focus.length; i++) {
      fo = FocusModel(
        id: focus[i].id,
        nameFocus: focus[i].nameFocus,
        factor: focus[i].factor,
        ptsTotal: focus[i].ptsTotal,
      );
      focusList.add(fo);
    }
    return buildList(question, focu, context);
  }

  Widget buildList(
      QuestionList question, FocusList focu, BuildContext context) {
    return StreamBuilder(
        stream: qrep.getQuestionModel,
        builder: (_, AsyncSnapshot<List<QuestionModel>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.none:
              return CircularProgressIndicator();
            case ConnectionState.active:
              if (snapshot.data != null) {
                return buildListQuestion(
                    snapshot.data, question, focu, context);
              }
              return CircularProgressIndicator();
            case ConnectionState.done:
              if (snapshot.data != null) {
                return buildListQuestion(
                    snapshot.data, question, focu, context);
              }
              return CircularProgressIndicator();
            default:
              if (snapshot.data != null) {
                return buildListQuestion(
                    snapshot.data, question, focu, context);
              }
              return CircularProgressIndicator();
          }
        });
  }

  Widget buildListQuestion(List<QuestionModel> quest, QuestionList question,
      FocusList focu, BuildContext context) {
    QuestionModel que;
    for (var i = 0; i < quest.length; i++) {
      que = QuestionModel(
        id: quest[i].id,
        idFocus: quest[i].idFocus,
        header: quest[i].header,
        factorRespuesta: quest[i].factorRespuesta,
      );
      questionList.add(que);
    }
    return Center(
      child: FloatingActionButton(
        onPressed: () {
          focu.setFocus = focusList;
          question.setQuestions = questionList;
          print(focu.getFocus.length);
          print(question.getQuestions.length);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScreenQuestion(
                index: 0,
              ),
            ),
          );
        },
        child: Icon(Icons.navigate_next),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
