import 'package:food_delivery_app_case_study/core/domain/cart/cart_local_data_base_repostory_provider.dart';
import 'package:food_delivery_app_case_study/core/domain/favourite/favourite_local_data_base_repostory_provider.dart';
import 'package:food_delivery_app_case_study/core/models/meals_model.dart';
import 'package:food_delivery_app_case_study/core/view_models/base_view_model/base.dart';
import 'package:food_delivery_app_case_study/config/locator.dart';

class FavouriteViewModel extends BaseViewModel {

  final CartLocalDatBaseRepositoryProvider _cartLocalDatBaseRepositoryProvider = locator<CartLocalDatBaseRepositoryProvider>();
  final FavouriteLocalDatBaseRepositoryProvider _favouriteLocalDatBaseRepositoryProvider = locator<FavouriteLocalDatBaseRepositoryProvider>();


  List<MealModel> get favouriteMeals => _favouriteLocalDatBaseRepositoryProvider.favouriteMealsList;

  Future<bool> getFavouriteMeals() async {
    setBusy(true);
    notifyListeners();
    final success = await _favouriteLocalDatBaseRepositoryProvider.getMealListFromLocalDataBase();
    setBusy(false);
    notifyListeners();
    return success;
  }

  void deleteAMealFromFavouriteList(String newMeal){
    _favouriteLocalDatBaseRepositoryProvider.deleteMealModelFromLocalDataBase(newMeal);
  }

  // cart feature
  void addAMealToCartList (String newMeal){
    _cartLocalDatBaseRepositoryProvider.setMealToCartLocalDataBase(newMeal);
  }
  List<MealModel> get cartMeals => _cartLocalDatBaseRepositoryProvider.cartMealsList;


}
