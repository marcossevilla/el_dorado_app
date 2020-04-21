import 'package:flutter/material.dart';

import '../models/doral_marker.dart';
import '../widgets/doral_marker_card.dart';

showMarkerInfo(BuildContext context, DoralMarker marker, IconData icon) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: DoralMarkerCard(marker: marker, icon: icon),
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
