//@dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/Tip/model/tip.dart';
import 'package:security_test_mobile/Tip/model/tip_list.dart';
import 'package:security_test_mobile/Widget/title_header.dart';

class TipScreen extends StatefulWidget {
  final String id;

  TipScreen({
    Key key,
    this.id,
  });
  @override
  _TipScreen createState() => _TipScreen();
}

class _TipScreen extends State<TipScreen> {
  @override
  Widget build(BuildContext context) {
    final tip = Provider.of<TipList>(context);

    List<TipModel> tips = tip.getTip(widget.id);

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4268D3),
        title: Text('Consejos'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ListView.builder(
            itemCount: tips.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: TitleHeader(
                  title: tips[index].tip,
                  tamanio: screenHeight * 0.02,
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.05,
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.02,
                  ),
                  color: Colors.black,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
