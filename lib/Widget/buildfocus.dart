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

class BuildFocus extends StatelessWidget {
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

    FocusModel fo;
    QuestionModel que;

    return Center(
      child: StreamBuilder(
          stream: frep.getFocusModel,
          builder: (context, AsyncSnapshot<List<FocusModel>> snapshot) {
            if (snapshot.data != null) {
              for (var i = 0; i < snapshot.data.length; i++) {
                fo = FocusModel(
                  id: snapshot.data[i].id,
                  nameFocus: snapshot.data[i].nameFocus,
                  factor: snapshot.data[i].factor,
                  ptsTotal: snapshot.data[i].ptsTotal,
                );
                focusList.add(fo);
              }
            }
            return Center(
              child: StreamBuilder(
                  stream: qrep.getQuestionModel,
                  builder:
                      (context, AsyncSnapshot<List<QuestionModel>> snapshot) {
                    if (snapshot.data != null) {
                      for (var i = 0; i < snapshot.data.length; i++) {
                        que = QuestionModel(
                          id: snapshot.data[i].id,
                          idFocus: snapshot.data[i].idFocus,
                          header: snapshot.data[i].header,
                          factorRespuesta: snapshot.data[i].factorRespuesta,
                        );
                        questionList.add(que);
                      }
                    }
                    return Center(
                      child: FloatingActionButton(
                        onPressed: () {
                          focus.setFocus = focusList;
                          question.setQuestions = questionList;
                          print(focus.getFocus.length);
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
                  }),
            );
          }),
    );
  }
}
