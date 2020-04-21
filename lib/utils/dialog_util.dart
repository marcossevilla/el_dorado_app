import 'package:el_dorado_app/utils/image_util.dart';
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
        child: _buildDoralMarkerCard(marker, context, icon),
      );
    },
  );
}

Widget _buildDoralMarkerCard(
  DoralMarker marker,
  BuildContext context,
  IconData icon,
) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Container(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Image.network(ImageUtil.exportImageToURL(marker.image)),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(marker.name,
                      style: Theme.of(context).textTheme.headline5),
                  Text(
                    marker.category.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Icon(icon),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
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
