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
      'A continuación, se presentarán una serie de preguntas, las cuales deberá responder escogiendo entre 4 alternativas. Una vez terminado el cuestionario se evaluaran los resultados y se entregaran consejos de ayuda para mejorar su conocimiento en seguridad de la información.';
  String _intromodel =
      'Utilizaremos unas escala de medición basada en nuestro modelo de madurez, el cual posee 4 niveles, siendo cofré el mas debil y bunker el mas fuerte. Segun su puntaje construido a partir de su interacción con la aplicación y nuestra matriz de evaluación, se asignará un puntaje el cual representa su nivel en nuestro modelo.';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(height: null),
          ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: screenHeight * 0.04),
                child: Text(
                  'Instrucciones',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenHeight * 0.07,
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
                padding: EdgeInsets.only(
                    top: screenHeight * 0.04,
                    left: screenWidth * 0.04,
                    right: screenWidth * 0.05),
                child: Text(
                  _intro,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: screenHeight * 0.03,
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
                width: screenWidth * 0.6,
                height: screenHeight * 0.4,
                padding: EdgeInsets.only(top: screenHeight * 0.04),
                child: Image.asset('assets/ImagenModeloMadurez.png'),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.04,
                    left: screenWidth * 0.04,
                    right: screenWidth * 0.04),
                child: Text(
                  _intromodel,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: screenHeight * 0.03,
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
              BuildList(),
            ],
          )
        ],
      ),
    );
  }
}
