import 'package:flutter/material.dart';
import 'package:food_delivery_app_case_study/core/models/meals_model.dart';
import 'package:food_delivery_app_case_study/core/view_models/favourite_view_model/favourite_view_model.dart';
import 'package:food_delivery_app_case_study/ui/utils/tiles.dart';
import 'package:food_delivery_app_case_study/ui/widgets/custom_button_widget.dart';
import 'package:food_delivery_app_case_study/ui/widgets/custom_image.dart';
import '../../../utils/styles.dart';

class FavouriteItemWidget extends StatelessWidget {
  const FavouriteItemWidget({
    Key? key,
    required this.index,
    required this.viewModel,
  }) : super(key: key);
  final FavouriteViewModel viewModel;
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
                  image: viewModel.favouriteMeals[index].strMealThumb,
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
                        viewModel.favouriteMeals[index].strMeal,
                        style: titleText,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButtonWidget(
                          backgroundColor: Theme.of(context).primaryColor,
                          onPressed: () {
                            if (!(viewModel.cartMeals
                                .contains(viewModel.favouriteMeals[index]))) {
                              String newMeal = mealModelToMap(
                                  viewModel.favouriteMeals[index]);
                              viewModel.addAMealToCartList(newMeal);
                              showSnackBar(context,
                                  'Added the meal to cart successfully');
                            } else {
                              showSnackBar(
                                  context, 'The meal is already in the cart');
                            }
                          },
                          height: 50,
                          width: 100,
                          buttonText: "Add to Cart"),
                      CustomButtonWidget(
                        backgroundColor: Theme.of(context).primaryColor,
                        onPressed: () {
                          String newMeal =
                              mealModelToMap(viewModel.favouriteMeals[index]);

                          viewModel.deleteAMealFromFavouriteList(newMeal);

                          viewModel.getFavouriteMeals();
                        },
                        height: 50,
                        width: 50,
                        isIconButton: true,
                        icon: Icon(viewModel.favouriteMeals
                                .contains(viewModel.favouriteMeals[index])
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
