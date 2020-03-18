import 'package:el_dorado_app/models/doral_marker.dart';
import 'package:el_dorado_app/networking/services/marker_service.dart';
import 'package:el_dorado_app/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  MapController _mapController;
  MarkerService _markerService = MarkerService();

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: FutureBuilder(
        future: _markerService.getAllMarkers(),
        builder: (context, AsyncSnapshot<List<DoralMarker>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            return FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                center: LatLng(12.199036, -86.386451),
                zoom: 17.0,
              ),
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
                MarkerLayerOptions(
                  markers: snapshot.data.map((marker) {
                    return Marker(
                      width: 40.0,
                      height: 40.0,
                      builder: (context) => Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: HexColor.fromHex(marker.category.color),
                        ),
                        child: Icon(
                          FontAwesomeIcons.bicycle,
                          color: Colors.black,
                          size: 20.0,
                        ),
                      ),
                      point: LatLng(
                        double.parse(marker.lat),
                        double.parse(marker.long),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          } else {
            return Center(child: Text('Error'));
          }
        },
      ),
    );
  }
}
