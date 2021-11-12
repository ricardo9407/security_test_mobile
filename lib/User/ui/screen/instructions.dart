//@dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:security_test_mobile/Widget/buildList.dart';
import 'package:security_test_mobile/Widget/gradient_back.dart';

class Instructions extends StatefulWidget {
  @override
  _Instructions createState() => _Instructions();
}

class _Instructions extends State<Instructions> {
  String _intro =
      'A continuación se presentarán una serie de preguntas, las cuales deberá responder escogiendo entre 4 alternativas. Una vez terminado el cuestionario se evaluaran los resultados y se entregaran consejos de ayuda para mejorar su conocimiento en seguridad de la información';
  String _intromodel =
      'Utilizaremos unas escala de medición basada en nuestro modelo de madurez el cual posee 4 niveles, siendo cofre el mas debil y bunker el mas fuerte. Segun su puntaje construido a partir de su interacción con la aplicación y nuestrs matriz de evaluacion se asignara un puntaje el cual representa su nivel en nuestro modelo.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(height: null),
          ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 50.0),
                child: Text(
                  'Instrucciones',
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
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
                width: 300,
                height: 270,
                child: Text(
                  _intro,
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
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 250,
                height: 250,
                padding: EdgeInsets.only(top: 50.0),
                child: Image.asset('assets/ImagenModeloMadurez.png'),
              ),
              Container(
                padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                child: Text(
                  _intromodel,
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
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              BuildList(),
            ],
          )
        ],
      ),
    );
  }
}
