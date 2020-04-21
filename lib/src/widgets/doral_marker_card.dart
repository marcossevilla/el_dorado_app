import 'package:flutter/material.dart';

import '../utils/image_util.dart';
import '../models/doral_marker.dart';

class DoralMarkerCard extends StatelessWidget {
  DoralMarkerCard({
    this.marker,
    this.icon,
  });

  final DoralMarker marker;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
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
}
