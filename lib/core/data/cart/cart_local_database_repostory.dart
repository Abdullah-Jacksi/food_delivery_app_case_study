
import 'dart:developer';

import 'package:food_delivery_app_case_study/core/config/constants/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class CartLocalDataBaseRepository {

  void setMealsToCartLocalDataBase(String newMeal)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList(AppConstants.cartLocalDataBaseKey) ?? [];
    list.add(newMeal);
    prefs.setStringList(AppConstants.cartLocalDataBaseKey, list);
  }

  Future<List<String>> getMealsListFromCartLocalDataBase()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList(AppConstants.cartLocalDataBaseKey) ?? [];
    log("${list.length} repo");
    return list;
  }

  void deleteMealsFromCartLocalDataBase(String newMeal)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList(AppConstants.cartLocalDataBaseKey) ?? [];
    list.removeWhere((item) => item == newMeal);
    prefs.setStringList(AppConstants.cartLocalDataBaseKey, list);
  }



}