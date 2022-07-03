import 'dart:developer';

import 'package:food_delivery_app_case_study/core/constants/app_constant.dart';
import 'package:food_delivery_app_case_study/core/models/meals_model.dart';
import 'package:food_delivery_app_case_study/core/data/meals/meals_repository.dart';
import 'package:http/http.dart' as http;

class APIMealsRepository extends MealsRepository {

  @override
  Future<List<MealModel>?> fetchMeals(String category) async {
    try {
      http.Response response = await http.get(Uri.parse("${AppConstants.baseURL}${AppConstants.meals}?c=$category"));
      if(response.statusCode == 200) {
        return mealsModelFromMap(response.body).meals;
      }
    } catch (e) {
      log('there is an error: $e');
      return null;
    }
    return null;
  }
}
