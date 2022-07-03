import 'package:flutter/material.dart';
import 'package:food_delivery_app_case_study/core/view_models/categories_view_model/categoires_view_model.dart';
import 'package:food_delivery_app_case_study/ui/views/categories/widgets/category_item_widget.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<CategoriesViewModel>().fetchCategories(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesViewModel>(builder:
        (BuildContext context, CategoriesViewModel viewModel, Widget? child) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text("Categories"),
            centerTitle: true,
            // leading: Container(),
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
            child: Center(
              child: (viewModel.busy)
                  ? const Center(child: CircularProgressIndicator())
                  : viewModel.categories == null
                      ? const Text("There is an error!")
                      : ListView.builder(
                          itemCount: viewModel.categories!.length,
                          itemBuilder: (context, index) {
                            return CategoryItemWidget(
                                categoryModel:
                                    viewModel.categories![index]);
                          }),
            ),
          ));
    });
  }


}
