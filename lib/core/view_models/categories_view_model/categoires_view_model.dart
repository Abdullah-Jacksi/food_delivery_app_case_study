import 'package:food_delivery_app_case_study/core/domain/categories/categories_repositroy_provider.dart';
import 'package:food_delivery_app_case_study/core/models/categories_model.dart';
import 'package:food_delivery_app_case_study/core/view_models/base_view_model/base.dart';
import 'package:food_delivery_app_case_study/config/locator.dart';

class CategoriesViewModel extends BaseViewModel {

  final CategoriesRepositoryProvider _categoriesRepositoryProvider = locator<CategoriesRepositoryProvider>();

  List<CategoryModel>? get categories => _categoriesRepositoryProvider.categories;

  Future<bool> fetchCategories() async {
    setBusy(true);
    notifyListeners();
    final success = await _categoriesRepositoryProvider.fetchCategories();
    setBusy(false);
    notifyListeners();
    return success;
  }
}
