import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_case_study/core/data/cart/cart_local_database_repostory.dart';
import 'package:food_delivery_app_case_study/core/data/categories/api_categories_repository.dart';
import 'package:food_delivery_app_case_study/core/data/favourite/favourite_local_database_repostiry.dart';
import 'package:food_delivery_app_case_study/core/models/categories_model.dart';
import 'package:food_delivery_app_case_study/core/models/meals_model.dart';
import 'package:food_delivery_app_case_study/locator.dart';

class CartLocalDatBaseRepositoryProvider with ChangeNotifier {

  final CartLocalDataBaseRepository _cartLocalDataBaseRepository = locator<CartLocalDataBaseRepository>();


  List<MealModel> _cartMealsList = [];

  List<MealModel> get cartMealsList => _cartMealsList;

  Future<bool> getMealListFromCartLocalDataBase() async {
    _cartMealsList = [];
    final apiResponse = await _cartLocalDataBaseRepository.getMealsListFromCartLocalDataBase();
    for(var item in apiResponse){
      cartMealsList.add(mealModelFromMap(item));
    }
    notifyListeners();
    return true;
  }

  void setMealToCartLocalDataBase(String newMeal)async{
    _cartLocalDataBaseRepository.setMealsToCartLocalDataBase (newMeal);
  }

  void deleteMealFromCartLocalDataBase(String newMeal)async{
    _cartLocalDataBaseRepository.deleteMealsFromCartLocalDataBase(newMeal);
  }


}
