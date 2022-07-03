import 'package:flutter/material.dart';
import 'package:food_delivery_app_case_study/core/view_models/favourite_view_model/favourite_view_model.dart';
import 'package:food_delivery_app_case_study/ui/views/favourite/widgets/favourite_item_widget.dart';
import 'package:food_delivery_app_case_study/ui/views/meals/widgets/meal_item_widget.dart';
import 'package:provider/provider.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {

  @override
  void initState() {
    super.initState();
    Future.microtask( () {
      context.read<FavouriteViewModel>().getFavouriteMeals();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteViewModel>(builder:
        (BuildContext context, FavouriteViewModel viewModel, Widget? child) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text("Favourite"),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
            child: Center(
              child: (viewModel.busy)
                  ? const Center(child: CircularProgressIndicator())
                  : viewModel.favouriteMeals.isEmpty
                  ? const Center(child: Text("You don't have any favourite meals yet!"))
                  : ListView.builder(
                  itemCount: viewModel.favouriteMeals.length,
                  itemBuilder: (context, index) {
                    return FavouriteItemWidget(
                      viewModel: viewModel,
                        index :index );
                  }),
            ),
          ));
    });
  }
}
