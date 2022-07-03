import 'package:flutter/material.dart';
import 'package:food_delivery_app_case_study/core/config/constants/routes.dart';
import 'package:food_delivery_app_case_study/core/config/router_config.dart';
import 'package:food_delivery_app_case_study/core/config/theme/light_theme.dart';
import 'package:food_delivery_app_case_study/core/providers/category_name_provdier.dart';
import 'package:food_delivery_app_case_study/core/view_models/cart_view_model/cart_view_model.dart';
import 'package:food_delivery_app_case_study/core/view_models/categories_view_model/categoires_view_model.dart';
import 'package:food_delivery_app_case_study/core/view_models/favourite_view_model/favourite_view_model.dart';
import 'package:food_delivery_app_case_study/core/view_models/meals_view_model/meals_view_model.dart';
import 'package:food_delivery_app_case_study/locator.dart';
import 'package:provider/provider.dart';


void main() {
  setupLocator();
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => CategoriesViewModel()), // categoriesRepositoryProvider: categoriesRepositoryProvider
        ChangeNotifierProvider(
            create: (BuildContext context) => MealsViewModel()),
        ChangeNotifierProvider(
            create: (BuildContext context) => CategoryNameProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => FavouriteViewModel()),
        ChangeNotifierProvider(
            create: (BuildContext context) => CartViewModel()),
      ],
      child: MaterialApp(
        theme: light(),
        title: 'Food Delivery App',
        debugShowCheckedModeBanner: false,
        initialRoute: RoutePaths.splash,
        routes: AppRouter.routes(),
      ),
    );
  }
}


