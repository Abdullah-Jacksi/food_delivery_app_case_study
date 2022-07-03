import 'package:flutter/material.dart';
import 'package:food_delivery_app_case_study/core/models/meals_model.dart';
import 'package:food_delivery_app_case_study/core/view_models/cart_view_model/cart_view_model.dart';
import 'package:food_delivery_app_case_study/ui/utils/styles.dart';
import 'package:food_delivery_app_case_study/ui/widgets/custom_button_widget.dart';
import 'package:food_delivery_app_case_study/ui/widgets/custom_image.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    Key? key,
    required this.index,
    required this.viewModel,
  }) : super(key: key);
  final CartViewModel viewModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(10)),
        height: 120,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: CustomImage(
                  image: viewModel.cartMeals[index].strMealThumb,
                  height: 200,
                  width: double.infinity,
                )),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Expanded(
                      flex: 1,
                      child: Text(
                        viewModel.cartMeals[index].strMeal,
                        style: titleText,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButtonWidget(
                        backgroundColor: Colors.red,
                          onPressed: () {
                            String newMeal = mealModelToMap(
                                viewModel.cartMeals[index]);

                            viewModel.deleteAMealFromFavouriteList(newMeal);

                            viewModel.getCartMeals();

                          },
                          height: 50,
                          width: 100,
                          buttonText: "Delete from Cart"),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
