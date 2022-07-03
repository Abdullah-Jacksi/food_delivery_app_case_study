import 'dart:convert';
import 'package:equatable/equatable.dart';

MealsModel mealsModelFromMap(String str) => MealsModel.fromMap(json.decode(str));
String mealsModelToMap(MealsModel data) => json.encode(data.toMap());

MealModel mealModelFromMap(String str) => MealModel.fromMap(json.decode(str));
String mealModelToMap(MealModel data) => json.encode(data.toMap());

class MealsModel {
  MealsModel({
    required this.meals,
  });

  List<MealModel> meals;

  factory MealsModel.fromMap(Map<String, dynamic> json) => MealsModel(
    meals: json["meals"] == null ? [] : List<MealModel>.from(json["meals"].map((x) => MealModel.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "meals": meals == null ? null : List<dynamic>.from(meals.map((x) => x.toMap())),
  };
}

class MealModel  extends Equatable {
  MealModel({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  String strMeal;
  String strMealThumb;
  String idMeal;

  factory MealModel.fromMap(Map<String, dynamic> json) => MealModel(
    strMeal: json["strMeal"] ?? "",
    strMealThumb: json["strMealThumb"] ?? "",
    idMeal: json["idMeal"] ?? "",
  );

  Map<String, dynamic> toMap() => {
    "strMeal": strMeal ?? "",
    "strMealThumb": strMealThumb ?? "",
    "idMeal": idMeal ?? "",
  };

  @override
  List<Object> get props => [strMeal, strMealThumb, idMeal];


}
