import 'package:http/http.dart' as http;

import '../models/categories_model.dart';

class Services {
  static Future<CategoriesModel>? getAllCategories() async {
    http.Response response =
        await http.get(Uri.parse("https://anaajapp.com/api/categories"));
    if (response.statusCode == 200) {
      CategoriesModel model = categoriesModelFromJson(response.body);
      print(model);
      return model;
    } else {
      throw Exception('Failed to Data');
    }
  }
}
