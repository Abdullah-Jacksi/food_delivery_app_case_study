import 'package:flutter/material.dart';
import 'package:food_delivery_app_case_study/core/view_models/cart_view_model/cart_view_model.dart';
import 'package:food_delivery_app_case_study/core/view_models/favourite_view_model/favourite_view_model.dart';
import 'package:food_delivery_app_case_study/ui/views/cart/widgets/cart_item_widget.dart';
import 'package:food_delivery_app_case_study/ui/views/favourite/widgets/favourite_item_widget.dart';
import 'package:food_delivery_app_case_study/ui/views/meals/widgets/meal_item_widget.dart';
import 'package:provider/provider.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {

  @override
  void initState() {
    super.initState();
    Future.microtask( () {
      context.read<CartViewModel>().getCartMeals();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(builder:
        (BuildContext context, CartViewModel viewModel, Widget? child) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text("Cart"),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
            child: Center(
              child: (viewModel.busy)
                  ? const Center(child: CircularProgressIndicator())
                  : viewModel.cartMeals.isEmpty
                  ? const Center(child: Text("You don't have any meals in cart yet!"))
                  : ListView.builder(
                  itemCount: viewModel.cartMeals.length,
                  itemBuilder: (context, index) {
                    return CartItemWidget(
                        viewModel: viewModel,
                        index :index );
                  }),
            ),
          ));
    });
  }
}
