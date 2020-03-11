import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class DoralMap extends StatefulWidget {
  const DoralMap({
    Key key,
  }) : super(key: key);

  @override
  _DoralMapState createState() => _DoralMapState();
}

class _DoralMapState extends State<DoralMap> {
  MapController mapController;
  double rotation = 0.0;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 7,
          child: Container(
            padding: EdgeInsets.all(30.0),
            height: 500,
            width: double.infinity,
            child: Card(
              elevation: 10.0,
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(center: LatLng(12.19, -86.38), zoom: 15.0),
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
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Slider(
            value: rotation,
            min: 0.0,
            max: 360,
            onChanged: (double degree) {
              setState(() => rotation = degree);
              mapController.rotate(degree);
            },
          ),
        )
      ],
    );
  }
}
