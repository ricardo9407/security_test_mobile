import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:security_test_mobile/Question/ui/screen/screen_question.dart';
import 'package:security_test_mobile/Widget/gradient_back.dart';

class Instructions extends StatefulWidget {
  @override
  _Instructions createState() => _Instructions();
}

class _Instructions extends State<Instructions> {
  String intro =
      'A continuación se presentaran una serie de preguntas, las cuales debera responder escojiendo entre 4 alternativas. Una vez terminado el cuestionario se evaluaran los resultados y se entregaran links de ayuda para poder mejorar su conocimiento en seguridad de la informacion';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(height: null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Text('Instrucciones',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black12,
                              offset: Offset(0, 3),
                              blurRadius: 4,
                            )
                          ]))),
              Container(
                padding: EdgeInsets.only(top: 80.0),
                child: SizedBox(
                  width: 360.0,
                  height: 300.0,
                  child: Text(intro,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black12,
                              offset: Offset(0, 3),
                              blurRadius: 4,
                            )
                          ])),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenQuestion(),
                    ),
                  );
                },
                child: Icon(Icons.navigate_next),
                backgroundColor: Colors.lightBlue,
              ),
            ],
          )
        ],
      ),
    );
  }
}