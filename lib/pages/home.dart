import 'package:el_dorado_app/widgets/doral_dial.dart';
import 'package:flutter/material.dart';

import 'package:el_dorado_app/widgets/doral_map.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ciudad Doral'), elevation: 0.0),
      body: Stack(children: <Widget>[DoralMap()]),
      floatingActionButton: DoralDial(),
    );
  }
}
