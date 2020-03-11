import 'package:flutter/material.dart';

import 'pages/doral_map.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: Text('Ciudad Doral')),
        body: Column(
          children: <Widget>[
            Expanded(child: DoralMap()),
          ],
        ),
      ),
    );
  }
}
