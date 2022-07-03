import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery_app_case_study/core/data/categories/api_categories_repository.dart';
import 'package:food_delivery_app_case_study/core/data/meals/api_meals_repository.dart';
import 'package:food_delivery_app_case_study/core/models/categories_model.dart';
import 'package:food_delivery_app_case_study/core/models/meals_model.dart';
import 'package:food_delivery_app_case_study/config/locator.dart';

class MealsRepositoryProvider with ChangeNotifier {
  final APIMealsRepository _apiMealsRepository = locator<APIMealsRepository>();

  List<MealModel>? _meals = [];

  List<MealModel>? get meals => _meals;

  Future<bool> fetchMeals(String category) async {
    final apiResponse = await _apiMealsRepository.fetchMeals(category);
    if (apiResponse != null) {
      _meals = apiResponse;
      notifyListeners();
      return true;
    }
    return false;
  }
}
