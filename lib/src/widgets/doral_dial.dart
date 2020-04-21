import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../pages/markers.dart';
import '../pages/add_marker.dart';
import '../pages/categories.dart';

class DoralDial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_arrow,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.black,
      elevation: 0.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
          label: 'Nuevo marcador',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => _settingModalBottomSheet(context),
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
    );
  }
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) => AddMarker(),
  );
}
