import 'package:food_delivery_app_case_study/core/models/meals_model.dart';

abstract class MealsRepository {
  Future<List<MealModel>?> fetchMeals(String category);
}



