import 'package:flutter/material.dart';

class CategoryNameProvider with ChangeNotifier {
  String _categoryName = "";

  String get categoryName => _categoryName;

  void setCategoryName(String categoryName) {
    _categoryName = categoryName;
    notifyListeners();
  }
}