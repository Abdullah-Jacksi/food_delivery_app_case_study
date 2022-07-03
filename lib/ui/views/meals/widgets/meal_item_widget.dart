import 'package:flutter/material.dart';
import 'package:food_delivery_app_case_study/core/models/meals_model.dart';
import 'package:food_delivery_app_case_study/core/view_models/meals_view_model/meals_view_model.dart';
import 'package:food_delivery_app_case_study/ui/utils/tiles.dart';
import 'package:food_delivery_app_case_study/ui/widgets/custom_button_widget.dart';
import 'package:food_delivery_app_case_study/ui/widgets/custom_image.dart';
import '../../../utils/styles.dart';

class MealItemWidget extends StatelessWidget {
  const MealItemWidget({
    Key? key,
    required this.index,
    required this.viewModel,
  }) : super(key: key);
  final MealsViewModel viewModel;
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
                  image: viewModel.meals?[index].strMealThumb ?? "",
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
                        viewModel.meals?[index].strMeal ?? "",
                        style: titleText,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButtonWidget(
                          backgroundColor:Theme.of(context).primaryColor,
                          onPressed: () {
                              if (!(viewModel.cartMeals
                                  .contains(viewModel.meals?[index]))) {
                                String newMeal =
                                mealModelToMap(viewModel.meals![index]);
                                viewModel.addAMealToCartList(newMeal);
                                showSnackBar(context , 'Added the meal to cart successfully');
                              }
                              else{
                                showSnackBar(context , 'The meal is already in the cart');
                              }

                          },
                          height: 50,
                          width: 100,
                          buttonText: "Add to Cart"),
                      CustomButtonWidget(
                        backgroundColor:Theme.of(context).primaryColor,
                        onPressed: () {
                          String newMeal =
                          mealModelToMap(viewModel.meals![index]);

                          if (viewModel.favouriteMeals
                              .contains(viewModel.meals?[index])) {
                            viewModel.deleteAMealFromFavouriteList(newMeal);

                            viewModel.getFavouriteMeals();

                          } else {
                            viewModel.addAMealToFavouriteList(newMeal);

                            viewModel.getFavouriteMeals();

                            showSnackBar(context , 'Added the meal to favourite list successfully');
                          }
                        },
                        height: 50,
                        width: 50,
                        isIconButton: true,
                        icon: Icon(viewModel.favouriteMeals
                            .contains(viewModel.meals?[index])
                            ? Icons.favorite
                            : Icons.favorite_border),
                      ),
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
