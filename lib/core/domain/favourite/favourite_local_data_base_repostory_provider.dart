import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_case_study/core/data/categories/api_categories_repository.dart';
import 'package:food_delivery_app_case_study/core/data/favourite/favourite_local_database_repostiry.dart';
import 'package:food_delivery_app_case_study/core/models/categories_model.dart';
import 'package:food_delivery_app_case_study/core/models/meals_model.dart';
import 'package:food_delivery_app_case_study/locator.dart';

class FavouriteLocalDatBaseRepositoryProvider with ChangeNotifier {

  final FavouriteLocalDataBaseRepository _favouriteLocalDataBaseRepository = locator<FavouriteLocalDataBaseRepository>();


  List<MealModel> _favouriteMealsList = [];

  List<MealModel> get favouriteMealsList => _favouriteMealsList;

  Future<bool> getMealListFromLocalDataBase() async {
    _favouriteMealsList = [];
    final apiResponse = await _favouriteLocalDataBaseRepository.getMealListFromFavouriteLocalDataBase();
      for(var item in apiResponse){
        favouriteMealsList.add(mealModelFromMap(item));
      }
    notifyListeners();
      return true;
  }

  void setMealModelToLocalDataBase(String newMeal)async{
    _favouriteLocalDataBaseRepository.setMealToFavouriteLocalDataBase(newMeal);
  }

  void deleteMealModelFromLocalDataBase(String newMeal)async{
    _favouriteLocalDataBaseRepository.deleteMealFromFavouriteLocalDataBase(newMeal);
  }


}
