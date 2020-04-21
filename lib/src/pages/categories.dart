import 'package:flutter/material.dart';

import '../models/category.dart';
import '../services/category_service.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage();

  final CategoryService _categoryService = CategoryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categorías'), backgroundColor: Colors.green),
      body: FutureBuilder(
        future: _categoryService.getAllCategories(),
        builder: (context, AsyncSnapshot<List<Category>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(snapshot.data[index].name));
              },
            );
          } else {
            return Center(child: Text('Error'));
          }
        },
      ),
    );
  }
}
