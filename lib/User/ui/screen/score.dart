//@dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/Company/model/company.dart';
import 'package:security_test_mobile/Company/model/company_list.dart';
import 'package:security_test_mobile/Tip/ui/widget/buildListTip.dart';
import 'package:security_test_mobile/User/model/user.dart';
import 'package:security_test_mobile/User/model/user_list.dart';
import 'package:security_test_mobile/User/ui/screen/detailsScreen.dart';
import 'package:security_test_mobile/Widget/title_header.dart';

class Score extends StatefulWidget {
  @override
  _Score createState() => _Score();
}

class _Score extends State<Score> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final users = Provider.of<UserList>(context);
    final company = Provider.of<CompanyList>(context);

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    List<UserModel> trabajadores =
        users.getUsersCompany(user.getIdOrg, user.getId);
    CompanyModel comp = company.getcompany(user.getIdOrg);

    double xF1 = 0;
    double xF2 = 0;
    double xF3 = 0;
    double xF4 = 0;
    double xF5 = 0;
    double xTotal = 0;

    for (var i = 0; i < trabajadores.length; i++) {
      xF1 = xF1 + trabajadores[i].ptsF1;
      xF2 = xF2 + trabajadores[i].ptsF2;
      xF3 = xF3 + trabajadores[i].ptsF3;
      xF4 = xF4 + trabajadores[i].ptsF4;
      xF5 = xF5 + trabajadores[i].ptsF5;
    }

    xF1 = xF1 / trabajadores.length;
    xF2 = xF2 / trabajadores.length;
    xF3 = xF3 / trabajadores.length;
    xF4 = xF4 / trabajadores.length;
    xF5 = xF5 / trabajadores.length;

    xTotal = xF1 + xF2 + xF3 + xF4 + xF5;

    String nivel = ' ';
    String id;

    if (xTotal < 2.5) {
      nivel = 'Cofre (Nivel 1)';
      id = '1';
    } else {
      if (xTotal >= 2.5 && xTotal < 4) {
        nivel = 'Caja Fuerte (Nivel 2)';
        id = '2';
      } else {
        if (xTotal >= 4 && xTotal < 5.5) {
          nivel = 'Bobeda (Nivel 3)';
          id = '3';
        } else {
          if (xTotal >= 5.5 && xTotal < 7) {
            nivel = 'Bunker (Nivel 4)';
            id = '4';
          }
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4268D3),
        title: Text('Datos de ' + comp.name),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(comp.name),
                        content: Text("Direccion: " +
                            comp.address +
                            ".\n\n" +
                            "Telefono: " +
                            comp.phone +
                            "."),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Aceptar'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text('Detalles Empresa'),
                ),
              ),
              TitleHeader(
                title: 'Trabajadores total: ' + trabajadores.length.toString(),
                tamanio: screenHeight * 0.02,
                padding: EdgeInsets.only(
                  top: screenHeight * 0.01,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.02,
                ),
                color: Colors.black,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TitleHeader(
                    title: 'Resultado de cada trabajador: ',
                    tamanio: screenHeight * 0.02,
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.03,
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.02,
                    ),
                    color: Colors.black,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.02,
                    ),
                    child: DropdownButton<UserModel>(
                      hint: Text(
                        "Trabajador",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      iconEnabledColor: Colors.black,
                      iconDisabledColor: Colors.black,
                      items: trabajadores
                          .map<DropdownMenuItem<UserModel>>((accountType) {
                        return DropdownMenuItem<UserModel>(
                          value: accountType,
                          child:
                              Text(accountType.id + " / " + accountType.name),
                        );
                      }).toList(),
                      onChanged: (opt) {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Resultados."),
                            content: Text("Este Trabajador quedó en el nivel " +
                                opt.nivel +
                                " y su puntaje total es de " +
                                (opt.ptsF1 +
                                        opt.ptsF2 +
                                        opt.ptsF3 +
                                        opt.ptsF4 +
                                        opt.ptsF5)
                                    .toStringAsFixed(4) +
                                "."),
                            actions: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 20)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Aceptar'),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 20)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsScreen(user: opt),
                                    ),
                                  );
                                },
                                child: Text('Detalles'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              TitleHeader(
                title:
                    'Promedio Enfoque 1: ' + xF1.toStringAsFixed(4) + ' / 0.7',
                tamanio: screenHeight * 0.02,
                padding: EdgeInsets.only(
                  top: screenHeight * 0.03,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.02,
                ),
                color: Colors.black,
              ),
              TitleHeader(
                title:
                    'Promedio Enfoque 2: ' + xF2.toStringAsFixed(4) + ' / 1.4',
                tamanio: screenHeight * 0.02,
                padding: EdgeInsets.only(
                  top: screenHeight * 0.05,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.02,
                ),
                color: Colors.black,
              ),
              TitleHeader(
                title:
                    'Promedio Enfoque 3: ' + xF3.toStringAsFixed(4) + ' / 1.75',
                tamanio: screenHeight * 0.02,
                padding: EdgeInsets.only(
                  top: screenHeight * 0.05,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.02,
                ),
                color: Colors.black,
              ),
              TitleHeader(
                title:
                    'Promedio Enfoque 4: ' + xF4.toStringAsFixed(4) + ' / 2.1',
                tamanio: screenHeight * 0.02,
                padding: EdgeInsets.only(
                  top: screenHeight * 0.05,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.02,
                ),
                color: Colors.black,
              ),
              TitleHeader(
                title:
                    'Promedio Enfoque 5: ' + xF5.toStringAsFixed(4) + ' / 1.05',
                tamanio: screenHeight * 0.02,
                padding: EdgeInsets.only(
                  top: screenHeight * 0.05,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.02,
                ),
                color: Colors.black,
              ),
              TitleHeader(
                title: 'Promedio del puntaje total: ' +
                    xTotal.toStringAsFixed(4) +
                    ' / ' +
                    ((xTotal / 7) * 100).toStringAsFixed(0) +
                    '%',
                tamanio: screenHeight * 0.02,
                padding: EdgeInsets.only(
                  top: screenHeight * 0.05,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.02,
                ),
                color: Colors.black,
              ),
              TitleHeader(
                title:
                    'En base al promedio de los resultados de todos los usuarios, el nivel general es: ' +
                        nivel,
                tamanio: screenHeight * 0.02,
                padding: EdgeInsets.only(
                  top: screenHeight * 0.03,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.02,
                ),
                color: Colors.black,
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              BuildListTip(id: id, boolean: false),
            ],
          ),
        ],
      ),
    );
  }
}
