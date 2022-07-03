import 'package:food_delivery_app_case_study/core/models/categories_model.dart';

abstract class CategoriesRepository {
  Future<List<CategoryModel>?> fetchCategories();
}



