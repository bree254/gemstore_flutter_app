import 'package:flutter/material.dart';
import 'package:gemstore_flutter/screens/cart/index.dart';
import 'package:gemstore_flutter/screens/dashboard/index.dart';
import 'package:gemstore_flutter/screens/profile/index.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:gemstore_flutter/screens/search/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _pageController;
  int _selectedPage = 0;

  List<Widget> pages = [
    const DashBoardScreen(),
    SearchScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  Widget build(BuildContext context) {
    return  Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index)=> setState(() {
          _selectedPage = index;
        }),
        children: [
          ...pages
        ],

      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedPage,
        showElevation: false,
        onItemSelected: (index) => _onItemTapped(index),
        items: [
          FlashyTabBarItem(
            icon: const Icon(Icons.home_outlined, size: 23),
            activeColor: Colors.black,
            title: const Text('Home'),
            inactiveColor: Colors.black,
          ),

          FlashyTabBarItem(
            icon: const Icon(Icons.search_outlined, size: 23),
            title: const Text('Search'),
            activeColor: Colors.black,
            inactiveColor: Colors.black,

          ),

          FlashyTabBarItem(
            icon: const Icon(Icons.shopping_bag_outlined, size: 23),
            title: const Text('Cart'),
            activeColor: Colors.black,
            inactiveColor: Colors.black,

          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.account_circle_outlined, size: 23,),
            title: const Text('Profile'),
            activeColor: Colors.black,
            inactiveColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
