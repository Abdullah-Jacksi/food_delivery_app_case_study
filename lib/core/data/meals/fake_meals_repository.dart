import 'dart:developer';
import 'package:food_delivery_app_case_study/core/models/meals_model.dart';
import 'package:food_delivery_app_case_study/core/data/meals/meals_repository.dart';

class FakeMealsRepository extends MealsRepository {
  @override
  Future<List<MealModel>?> fetchMeals(String category) async {
    return [];
  }
}
