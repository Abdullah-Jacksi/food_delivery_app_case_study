import 'dart:developer';
import 'package:food_delivery_app_case_study/core/constants/app_constant.dart';
import 'package:food_delivery_app_case_study/core/models/categories_model.dart';
import 'package:food_delivery_app_case_study/core/data/categories/categories_repository.dart';
import 'package:http/http.dart' as http;

class APICategoriesRepository extends CategoriesRepository {

  @override
  Future<List<CategoryModel>?> fetchCategories() async {
    try {
      http.Response response = await http.get(Uri.parse(AppConstants.baseURL+AppConstants.categories));
      if(response.statusCode == 200){
        return categoriesModelFromMap(response.body).categories;
      }
    } catch (e) {
      log('there is an error: $e');
      return null;
    }
    return null;
  }
}
