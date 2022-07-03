import 'dart:convert';

CategoriesModel categoriesModelFromMap(String str) => CategoriesModel.fromMap(json.decode(str));

String categoriesModelToMap(CategoriesModel data) => json.encode(data.toMap());

class CategoriesModel {
  CategoriesModel({
    required this.categories,
  });

  List<CategoryModel> categories;

  factory CategoriesModel.fromMap(Map<String, dynamic> json) => CategoriesModel(
    categories: json["categories"] == null ? [] : List<CategoryModel>.from(json["categories"].map((x) => CategoryModel.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "categories": categories == null ? null : List<dynamic>.from(categories.map((x) => x.toMap())),
  };
}

class CategoryModel {
  CategoryModel({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
    idCategory: json["idCategory"] == null ? "" : json["idCategory"],
    strCategory: json["strCategory"] == null ? "" : json["strCategory"],
    strCategoryThumb: json["strCategoryThumb"] == null ? "" : json["strCategoryThumb"],
    strCategoryDescription: json["strCategoryDescription"] == null ? "" : json["strCategoryDescription"],
  );

  Map<String, dynamic> toMap() => {
    "idCategory": idCategory == null ? "" : idCategory,
    "strCategory": strCategory == null ? "" : strCategory,
    "strCategoryThumb": strCategoryThumb == null ? "" : strCategoryThumb,
    "strCategoryDescription": strCategoryDescription == null ? "" : strCategoryDescription,
  };
}
