import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/doral_marker.dart';
import '../networking/services/category_service.dart';

class AddMarker extends StatefulWidget {
  @override
  _AddMarkerState createState() => _AddMarkerState();
}

class _AddMarkerState extends State<AddMarker> {
  final CategoryService _categoryService = CategoryService();

  DoralMarker _marker = DoralMarker();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Form(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Agregar marcador',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            TextFormField(decoration: InputDecoration(labelText: 'Nombre')),
            TextFormField(decoration: InputDecoration(labelText: 'Latitud')),
            TextFormField(decoration: InputDecoration(labelText: 'Longitud')),
            FutureBuilder(
              future: _categoryService.getAllCategories(),
              builder: (context, AsyncSnapshot<List<Category>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return DropdownButtonFormField<Category>(
                    items: snapshot.data.map((category) {
                      return DropdownMenuItem(
                        child: Text(category.name),
                        value: category,
                      );
                    }).toList(),
                    onChanged: (value) => _marker.category = value,
                  );
                } else {
                  return Center(child: Text('Error'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
