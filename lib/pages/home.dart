import 'package:el_dorado_app/widgets/doral_dial.dart';
import 'package:flutter/material.dart';

import 'package:el_dorado_app/widgets/doral_map.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ciudad Doral'),
      ),
      body: Stack(
        children: <Widget>[
          DoralMap(),
          // por si quieren añadir elementos sobre el mapa
          // que no sean markers si
          Column(children: []),
        ],
      ),
      floatingActionButton: DoralDial(),
    );
  }
}
