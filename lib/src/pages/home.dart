import 'package:flutter/material.dart';

import '../widgets/doral_map.dart';
import '../widgets/doral_dial.dart';

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
