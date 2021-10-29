//@dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/Tip/model/tip.dart';
import 'package:security_test_mobile/Tip/model/tip_list.dart';
import 'package:security_test_mobile/Widget/gradient_back.dart';
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4268D3),
        title: Text('Consejos'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(height: null),
          ListView.builder(
            itemCount: tips.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: TitleHeader(
                  title: tips[index].tip,
                  tamanio: 25.0,
                  padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 10.0),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
