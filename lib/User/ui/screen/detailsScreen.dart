//@dart=2.9

import 'package:flutter/material.dart';
import 'package:security_test_mobile/User/model/user.dart';
import 'package:security_test_mobile/Widget/title_header.dart';

class DetailsScreen extends StatefulWidget {
  final UserModel user;

  DetailsScreen({
    Key key,
    @required this.user,
  });

  @override
  _DetailsScreen createState() => _DetailsScreen();
}

class _DetailsScreen extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4268D3),
        title: Text('Detalles de ' + widget.user.name),
      ),
      body: ListView(
        children: <Widget>[
          Flexible(
            child: TitleHeader(
              title: 'Nombre: ' + widget.user.name,
              tamanio: 15.0,
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 10.0),
              color: Colors.black,
            ),
          ),
          Flexible(
            child: TitleHeader(
              title: 'Cargo: ' + widget.user.cargo,
              tamanio: 15.0,
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 10.0),
              color: Colors.black,
            ),
          ),
          Flexible(
            child: TitleHeader(
              title: 'Puntaje Total: ' +
                  (widget.user.ptsF1 +
                          widget.user.ptsF2 +
                          widget.user.ptsF3 +
                          widget.user.ptsF4 +
                          widget.user.ptsF5)
                      .toString(),
              tamanio: 15.0,
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 10.0),
              color: Colors.black,
            ),
          ),
          Flexible(
            child: TitleHeader(
              title: 'Nivel: ' + widget.user.nivel,
              tamanio: 15.0,
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 10.0),
              color: Colors.black,
            ),
          ),
          Flexible(
            child: TitleHeader(
              title: 'Puntaje enfoque Organización, su contexto y seguridad: ' +
                  widget.user.ptsF1.toStringAsFixed(4),
              tamanio: 15.0,
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 10.0),
              color: Colors.black,
            ),
          ),
          Flexible(
            child: TitleHeader(
              title: 'Puntaje enfoque Planificación y soporte: ' +
                  widget.user.ptsF2.toStringAsFixed(4),
              tamanio: 15.0,
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 10.0),
              color: Colors.black,
            ),
          ),
          Flexible(
            child: TitleHeader(
              title: 'Puntaje enfoque Evaluación de operación y mejora: ' +
                  widget.user.ptsF3.toStringAsFixed(4),
              tamanio: 15.0,
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 10.0),
              color: Colors.black,
            ),
          ),
          Flexible(
            child: TitleHeader(
              title: 'Puntaje enfoque Seguridad y controles: ' +
                  widget.user.ptsF4.toStringAsFixed(4),
              tamanio: 15.0,
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 10.0),
              color: Colors.black,
            ),
          ),
          Flexible(
            child: TitleHeader(
              title: 'Puntaje enfoque Gestión y cumplimiento: ' +
                  widget.user.ptsF5.toStringAsFixed(4),
              tamanio: 15.0,
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 10.0),
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
