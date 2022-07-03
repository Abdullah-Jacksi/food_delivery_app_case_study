import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery_app_case_study/core/data/categories/api_categories_repository.dart';
import 'package:food_delivery_app_case_study/core/models/categories_model.dart';
import 'package:food_delivery_app_case_study/locator.dart';

class CategoriesRepositoryProvider with ChangeNotifier {

  final APICategoriesRepository _apiCategoriesRepository = locator<APICategoriesRepository>();


  List<CategoryModel>? _categories = [];

  List<CategoryModel>? get categories => _categories;

  Future<bool> fetchCategories() async {
    final apiResponse = await _apiCategoriesRepository.fetchCategories();
    if (apiResponse != null) {
      _categories = apiResponse;
      notifyListeners();
      return true;
    }
    return false;
  }
}
