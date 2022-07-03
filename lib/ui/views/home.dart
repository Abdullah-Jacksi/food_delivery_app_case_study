import 'package:flutter/material.dart';
import 'package:food_delivery_app_case_study/ui/views/cart/cart_view.dart';
import 'package:food_delivery_app_case_study/ui/views/categories/categories_view.dart';
import 'package:food_delivery_app_case_study/ui/views/favourite/favourite_view.dart';
import 'package:food_delivery_app_case_study/ui/widgets/bottom_nav_item_widget.dart';

class Home extends StatefulWidget {
  final int pageIndex;
  const Home({required this.pageIndex});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController? _pageController;
  int _pageIndex = 0;
  List<Widget>? _screens = [];
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _pageIndex = widget.pageIndex;
    _pageController = PageController(initialPage: widget.pageIndex);
    _screens = [
      const CategoriesView(),
      const FavouriteView(),
      const CartView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),

        child: Row(children: [
          BottomNavItem(iconData: Icons.home, isSelected: _pageIndex == 0, onTap: () => _setPage(0)),
          BottomNavItem(iconData: Icons.favorite, isSelected: _pageIndex == 1, onTap: () => _setPage(1)),
          BottomNavItem(iconData: Icons.shopping_bag, isSelected: _pageIndex == 2, onTap: () => _setPage(2)),
        ]),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _screens!.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _screens![index];
        },
      ),
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController!.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}
