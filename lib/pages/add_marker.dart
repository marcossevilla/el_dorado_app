import 'package:flutter/material.dart';

import '../utils/dialog_util.dart';
import '../models/category.dart';
import '../models/doral_marker.dart';
import '../services/marker_service.dart';
import '../services/category_service.dart';

class AddMarker extends StatefulWidget {
  @override
  _AddMarkerState createState() => _AddMarkerState();
}

class _AddMarkerState extends State<AddMarker> {
  final CategoryService _categoryService = CategoryService();
  final MarkerService _markerService = MarkerService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  List<Category> _categories = [];
  DoralMarker _marker = DoralMarker();

  @override
  void initState() {
    _loadCategories();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  _loadCategories() async {
    _categories = await _categoryService.getAllCategories();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Agregar marcador',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) return 'Escribe un nombre';
                return null;
              },
              decoration: InputDecoration(labelText: 'Nombre'),
              onChanged: (value) => setState(() => _marker.name = value),
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) return 'Escribe la latitud';
                return null;
              },
              decoration: InputDecoration(labelText: 'Latitud'),
              onChanged: (value) => setState(() => _marker.lat = value),
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Escribe la longitud';
                return null;
              },
              decoration: InputDecoration(labelText: 'Longitud'),
              onChanged: (value) => setState(() => _marker.long = value),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: DropdownButtonFormField<Category>(
                validator: (value) {
                  if (value == null) return 'Elige una categoría';
                  return null;
                },
                items: _categories.map((category) {
                  return DropdownMenuItem(
                    child: Text(category.name),
                    value: category,
                  );
                }).toList(),
                onChanged: (value) => _marker.category = value,
              ),
            ),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : MaterialButton(
                    child: Text('Subir'),
                    color: Theme.of(context).primaryColor,
                    onPressed: validateSubmit,
                  ),
          ],
        ),
      ),
    );
  }

  void validateSubmit() async {
    if (!_formKey.currentState.validate()) return;

    setState(() => _isLoading = true);

    bool itWorked = await _markerService.postNewMarker(_marker);

    setState(() => _isLoading = false);

    if (itWorked) {
      Navigator.of(context).popUntil((route) => route.isFirst);
      showInfo(context, 'Listo', 'El marcador se ha guardado exitosamente');
    } else {
      showInfo(context, 'Error', 'Hubo un problema guardando el marcador');
    }
  }
}
