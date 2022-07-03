import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery_app_case_study/core/domain/cart/cart_local_data_base_repostory_provider.dart';
import 'package:food_delivery_app_case_study/core/domain/categories/categories_repositroy_provider.dart';
import 'package:food_delivery_app_case_study/core/domain/favourite/favourite_local_data_base_repostory_provider.dart';
import 'package:food_delivery_app_case_study/core/domain/meals/meals_repositroy_provider.dart';
import 'package:food_delivery_app_case_study/core/models/categories_model.dart';
import 'package:food_delivery_app_case_study/core/data/categories/api_categories_repository.dart';
import 'package:food_delivery_app_case_study/core/models/meals_model.dart';
import 'package:food_delivery_app_case_study/core/view_models/base_view_model/base.dart';
import 'package:food_delivery_app_case_study/locator.dart';

class MealsViewModel extends BaseViewModel {

  final CartLocalDatBaseRepositoryProvider _cartLocalDatBaseRepositoryProvider = locator<CartLocalDatBaseRepositoryProvider>();
  final FavouriteLocalDatBaseRepositoryProvider _favouriteLocalDatBaseRepositoryProvider = locator<FavouriteLocalDatBaseRepositoryProvider>();
  final MealsRepositoryProvider _mealsRepositoryProvider = locator<MealsRepositoryProvider>();


  List<MealModel>? get meals => _mealsRepositoryProvider.meals;

  Future<bool> fetchMeals(String category) async {
    setBusy(true);
    notifyListeners();
    final success = await _mealsRepositoryProvider.fetchMeals(category);
    setBusy(false);
    notifyListeners();
    return success;
  }

  // favourite feature
  void addAMealToFavouriteList (String newMeal){
    _favouriteLocalDatBaseRepositoryProvider.setMealModelToLocalDataBase(newMeal);
  }

  void deleteAMealFromFavouriteList(String newMeal){
    _favouriteLocalDatBaseRepositoryProvider.deleteMealModelFromLocalDataBase(newMeal);
  }

  List<MealModel> get favouriteMeals => _favouriteLocalDatBaseRepositoryProvider.favouriteMealsList;

  Future<void> getFavouriteMeals() async {
     await _favouriteLocalDatBaseRepositoryProvider.getMealListFromLocalDataBase();
    notifyListeners();
  }


  // cart feature
  void addAMealToCartList (String newMeal){
    _cartLocalDatBaseRepositoryProvider.setMealToCartLocalDataBase(newMeal);
  }
  List<MealModel> get cartMeals => _cartLocalDatBaseRepositoryProvider.cartMealsList;


}
