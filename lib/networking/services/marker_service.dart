import 'dart:convert';

import 'package:http/http.dart' as http;

import '../urls.dart';
import '../../models/doral_marker.dart';

class MarkerService {
  Future<List<DoralMarker>> getAllMarkers() async {
    List<DoralMarker> markers = [];

    // get markers from api
    http.Response res = await http.get(NetworkUtil.markers);

    // decode json to map dart object
    var decodedData = jsonDecode(res.body);

    // map categories and serialize data
    for (var item in decodedData) {
      final marker = DoralMarker.fromJson(item);
      markers.add(marker);
    }

    return markers;
  }
}
