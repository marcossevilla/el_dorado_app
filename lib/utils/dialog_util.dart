import 'package:flutter/material.dart';

import 'package:el_dorado_app/models/doral_marker.dart';

showMarkerInfo(BuildContext context, DoralMarker marker, IconData icon) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          height: 200,
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(marker.name, style: Theme.of(context).textTheme.headline4),
              Text(
                marker.category.name,
                style: Theme.of(context).textTheme.headline6,
              ),
              Icon(icon),
            ],
          ),
        ),
      );
    },
  );
}

showInfo(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
      );
    },
  );
}
