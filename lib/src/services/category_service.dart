import 'dart:convert';

import 'package:http/http.dart' as http;

import '../urls.dart';
import '../models/category.dart';

class CategoryService {
  Future<List<Category>> getAllCategories() async {
    List<Category> categories = [];

    // get categories from api
    http.Response res = await http.get(NetworkUtil.categories);

    // decode json to map dart object
    var decodedData = jsonDecode(res.body);

    // map categories and serialize data
    for (var item in decodedData) {
      final category = Category.fromJson(item);
      categories.add(category);
    }

    return categories;
  }
}
