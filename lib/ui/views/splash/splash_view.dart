import 'package:flutter/material.dart';
import 'package:food_delivery_app_case_study/core/config/constants/routes.dart';
import 'package:food_delivery_app_case_study/core/config/functions.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    router();
  }

  void router() async {
    Future.delayed(const Duration(seconds: 1), () {
      Functions.goTo(context, path: RoutePaths.home , pushAndReplace:true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("The Logo")),
    );
  }
}
