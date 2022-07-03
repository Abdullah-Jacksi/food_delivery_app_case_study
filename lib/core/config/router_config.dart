import 'package:flutter/widgets.dart';
import 'package:food_delivery_app_case_study/core/config/constants/routes.dart';
import 'package:food_delivery_app_case_study/ui/views/cart/cart_view.dart';
import 'package:food_delivery_app_case_study/ui/views/categories/categories_view.dart';
import 'package:food_delivery_app_case_study/ui/views/favourite/favourite_view.dart';
import 'package:food_delivery_app_case_study/ui/views/home.dart';
import 'package:food_delivery_app_case_study/ui/views/meals/meals_view.dart';
import 'package:food_delivery_app_case_study/ui/views/splash/splash_view.dart';

class AppRouter {
  static dynamic routes() => {
    RoutePaths.splash: (BuildContext context) => const SplashView(),
    RoutePaths.home: (BuildContext context) =>  const Home(pageIndex: 0,),
    RoutePaths.categories: (BuildContext context) => const CategoriesView(),
    RoutePaths.meals: (BuildContext context) => const MealsView(),
    RoutePaths.favourite: (BuildContext context) => const FavouriteView(),
    RoutePaths.cart: (BuildContext context) => const CartView(),
  };
}
