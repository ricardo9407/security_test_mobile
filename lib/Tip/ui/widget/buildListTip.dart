//@dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_test_mobile/Tip/model/tip.dart';
import 'package:security_test_mobile/Tip/model/tip_list.dart';
import 'package:security_test_mobile/Tip/repository/repository_tip.dart';
import 'package:security_test_mobile/User/ui/screen/tip_screen.dart';

class BuildListTip extends StatefulWidget {
  final String id;

  BuildListTip({
    Key key,
    this.id,
  });

  @override
  State<BuildListTip> createState() => _BuildListTip();
}

class _BuildListTip extends State<BuildListTip> {
  final trep = RepositoryTip();

  List<TipModel> tipList = [];

  @override
  Widget build(BuildContext context) {
    final tip = Provider.of<TipList>(context);

    trep.fetchTip();

    return Center(
      child: StreamBuilder(
        stream: trep.getTipModel,
        builder: (_, AsyncSnapshot<List<TipModel>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.none:
              return CircularProgressIndicator();
            case ConnectionState.active:
              if (snapshot.data != null) {
                return buildListTip(snapshot.data, tip, context);
              }
              return CircularProgressIndicator();
            case ConnectionState.done:
              if (snapshot.data != null) {
                return buildListTip(snapshot.data, tip, context);
              }
              return CircularProgressIndicator();
            default:
              if (snapshot.data != null) {
                return buildListTip(snapshot.data, tip, context);
              }
              return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget buildListTip(List<TipModel> tips, TipList tip, context) {
    TipModel aux;
    for (var i = 0; i < tips.length; i++) {
      aux = TipModel(
        id: tips[i].id,
        tip: tips[i].tip,
      );
      tipList.add(aux);
    }
    return Center(
      child: FloatingActionButton(
        onPressed: () {
          tip.setTip = tipList;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TipScreen(id: widget.id),
            ),
          );
        },
        child: Icon(Icons.navigate_next),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
