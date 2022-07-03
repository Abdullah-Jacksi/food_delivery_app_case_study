import 'package:flutter/material.dart';
import 'package:food_delivery_app_case_study/config/category_name_provdier.dart';
import 'package:food_delivery_app_case_study/core/view_models/meals_view_model/meals_view_model.dart';
import 'package:food_delivery_app_case_study/ui/views/meals/widgets/meal_item_widget.dart';
import 'package:provider/provider.dart';

class MealsView extends StatefulWidget {
  const MealsView({Key? key}) : super(key: key);

  @override
  State<MealsView> createState() => _MealsViewState();
}

class _MealsViewState extends State<MealsView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      var categoryNameProvider = Provider.of<CategoryNameProvider>(context, listen: false);
      context.read<MealsViewModel>().fetchMeals(categoryNameProvider.categoryName);
      // context.read<MealsViewModel>().getFavouriteMeals();
    });
  }

  @override
  Widget build(BuildContext context) {
    var categoryNameProvider =
        Provider.of<CategoryNameProvider>(context, listen: false);

    return Consumer<MealsViewModel>(builder:
        (BuildContext context, MealsViewModel viewModel, Widget? child) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(categoryNameProvider.categoryName),
            centerTitle: true,
            leading: const BackButton(),
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
            child: Center(
              child: (viewModel.busy)
                  ? const Center(child: CircularProgressIndicator())
                  // : viewModel.meals == null
                  //     ? const Text("There is an error!")
                      : ListView.builder(
                          itemCount: viewModel.meals!.length,
                          itemBuilder: (context, index) {
                            return MealItemWidget(
                                viewModel: viewModel,
                                index: index);
                          }),
            ),
          ));
    });
  }
}
