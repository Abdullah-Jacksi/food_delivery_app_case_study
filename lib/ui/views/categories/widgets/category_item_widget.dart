import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_case_study/config/functions.dart';
import 'package:food_delivery_app_case_study/core/constants/routes.dart';
import 'package:food_delivery_app_case_study/core/models/categories_model.dart';
import 'package:food_delivery_app_case_study/config/category_name_provdier.dart';
import 'package:food_delivery_app_case_study/ui/utils/styles.dart';
import 'package:food_delivery_app_case_study/ui/widgets/custom_image.dart';
import 'package:provider/provider.dart';

class CategoryItemWidget extends StatelessWidget {
   const CategoryItemWidget({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Provider.of<CategoryNameProvider>(context , listen: false).setCategoryName(categoryModel.strCategory);
        Functions.goTo(context, path: RoutePaths.meals);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              CustomImage(image: categoryModel.strCategoryThumb,height: 200,width: double.infinity,),
              const SizedBox(height: 20,),
              Text(categoryModel.strCategory , style: titleText),
              const SizedBox(height: 5,),
            ],
          ),
        ),
      ),
    );
  }
}