import 'dart:developer';
import 'package:food_delivery_app_case_study/core/models/categories_model.dart';
import 'package:food_delivery_app_case_study/core/data/categories/categories_repository.dart';

class FakeCategoriesRepository extends CategoriesRepository {
  @override
  Future<List<CategoryModel>?> fetchCategories() async {
    return [];
  }
}
