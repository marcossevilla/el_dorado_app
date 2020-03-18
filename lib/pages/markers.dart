import 'package:flutter/material.dart';

import '../models/doral_marker.dart';
import '../networking/services/marker_service.dart';

class MarkersPage extends StatelessWidget {
  MarkersPage();

  final MarkerService _markerService = MarkerService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marcadores'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: _markerService.getAllMarkers(),
        builder: (context, AsyncSnapshot<List<DoralMarker>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index].name),
                );
              },
            );
          } else {
            return Text('Error');
          }
        },
      ),
    );
  }
}
