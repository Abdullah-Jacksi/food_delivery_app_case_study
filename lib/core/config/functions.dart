import 'package:flutter/material.dart';

class Functions {
  static void goTo(BuildContext context,
      {required String path, bool pushAndReplace = false, dynamic args}) {
    if (pushAndReplace) {
      Navigator.pushNamedAndRemoveUntil(
          context, path, (Route<dynamic> route) => false,
          arguments: args);
    } else {
      Navigator.pushNamed(context, path, arguments: args);
    }
  }
}