
import 'dart:developer';

import 'package:food_delivery_app_case_study/core/constants/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class FavouriteLocalDataBaseRepository {

  void setMealToFavouriteLocalDataBase(String newMeal)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList(AppConstants.favouriteLocalDataBaseKey) ?? [];
    list.add(newMeal);
    prefs.setStringList(AppConstants.favouriteLocalDataBaseKey, list);
  }

  Future<List<String>> getMealListFromFavouriteLocalDataBase()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList(AppConstants.favouriteLocalDataBaseKey) ?? [];
    log("${list.length} repo");
    return list;
  }

  void deleteMealFromFavouriteLocalDataBase(String newMeal)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList(AppConstants.favouriteLocalDataBaseKey) ?? [];
    list.removeWhere((item) => item == newMeal);
    prefs.setStringList(AppConstants.favouriteLocalDataBaseKey, list);
  }



}