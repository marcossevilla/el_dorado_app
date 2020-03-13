import 'package:el_dorado_app/pages/categories.dart';
import 'package:el_dorado_app/pages/markers.dart';
import 'package:el_dorado_app/widgets/doral_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DoralMap(),
          // por si quieren añadir elementos sobre el mapa
          // que no sean markers si
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [],
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_arrow,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.add),
            backgroundColor: Colors.red,
            label: 'Nuevo marcador',
            labelStyle: TextStyle(fontSize: 18.0),
          ),
          SpeedDialChild(
            child: Icon(Icons.location_on),
            backgroundColor: Colors.blue,
            label: 'Marcadores',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MarkersPage()),
            ),
          ),
          SpeedDialChild(
            child: Icon(Icons.list),
            backgroundColor: Colors.green,
            label: 'Categorías',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CategoriesPage()),
            ),
          ),
        ],
      ),
    );
  }
}
