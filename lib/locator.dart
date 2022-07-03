import 'package:food_delivery_app_case_study/core/data/cart/cart_local_database_repostory.dart';
import 'package:food_delivery_app_case_study/core/data/categories/api_categories_repository.dart';
import 'package:food_delivery_app_case_study/core/data/favourite/favourite_local_database_repostiry.dart';
import 'package:food_delivery_app_case_study/core/data/meals/api_meals_repository.dart';
import 'package:food_delivery_app_case_study/core/domain/cart/cart_local_data_base_repostory_provider.dart';
import 'package:food_delivery_app_case_study/core/domain/categories/categories_repositroy_provider.dart';
import 'package:food_delivery_app_case_study/core/domain/favourite/favourite_local_data_base_repostory_provider.dart';
import 'package:food_delivery_app_case_study/core/domain/meals/meals_repositroy_provider.dart';
import 'package:get_it/get_it.dart';



GetIt locator = GetIt.instance;

void setupLocator() {

  locator.registerLazySingleton(() => APICategoriesRepository());
  locator.registerLazySingleton(() => CategoriesRepositoryProvider());

  locator.registerLazySingleton(() => CartLocalDataBaseRepository());
  locator.registerLazySingleton(() => CartLocalDatBaseRepositoryProvider());

  locator.registerLazySingleton(() => FavouriteLocalDataBaseRepository());
  locator.registerLazySingleton(() => FavouriteLocalDatBaseRepositoryProvider());

  locator.registerLazySingleton(() => APIMealsRepository());
  locator.registerLazySingleton(() => MealsRepositoryProvider());

}
