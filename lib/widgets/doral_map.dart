import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class DoralMap extends StatefulWidget {
  const DoralMap({
    Key key,
  }) : super(key: key);

  @override
  _DoralMapState createState() => _DoralMapState();
}

class _DoralMapState extends State<DoralMap> {
  MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: FlutterMap(
        mapController: mapController,
        options: MapOptions(center: LatLng(12.199036, -86.386451), zoom: 17.0),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://api.tiles.mapbox.com/v4/"
                "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1IjoibWFyY29zc2V2aWxsYSIsImEiOiJjanhqNnhieG4wMG45M3hxZnNzbmwybWxmIn0.F1eTkmT9yWv0jc0HfJhu4A',
              'id': 'mapbox.streets',
            },
          ),
          MarkerLayerOptions(markers: []),
        ],
      ),
    );
  }
}
