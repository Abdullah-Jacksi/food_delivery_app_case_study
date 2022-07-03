import 'package:food_delivery_app_case_study/core/domain/cart/cart_local_data_base_repostory_provider.dart';
import 'package:food_delivery_app_case_study/core/domain/favourite/favourite_local_data_base_repostory_provider.dart';
import 'package:food_delivery_app_case_study/core/models/meals_model.dart';
import 'package:food_delivery_app_case_study/core/view_models/base_view_model/base.dart';
import 'package:food_delivery_app_case_study/locator.dart';

class CartViewModel extends BaseViewModel {

  final CartLocalDatBaseRepositoryProvider _cartLocalDatBaseRepositoryProvider = locator<CartLocalDatBaseRepositoryProvider>();


  List<MealModel> get cartMeals => _cartLocalDatBaseRepositoryProvider.cartMealsList;

  Future<bool> getCartMeals() async {
    setBusy(true);
    notifyListeners();
    final success = await _cartLocalDatBaseRepositoryProvider.getMealListFromCartLocalDataBase();
    setBusy(false);
    notifyListeners();
    return success;
  }

  void deleteAMealFromFavouriteList(String newMeal){
    _cartLocalDatBaseRepositoryProvider.deleteMealFromCartLocalDataBase(newMeal);
  }

}
