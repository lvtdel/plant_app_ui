import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/ui/screens/signin_page.dart';
import 'package:plant_app/ui/screens/cart_page.dart';
import 'package:plant_app/ui/screens/favorite_page.dart';
import 'package:plant_app/ui/screens/home_page.dart';
import 'package:plant_app/ui/screens/profile_page.dart';
import 'package:plant_app/ui/screens/scan_page.dart';

import '../models/plants.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Plant> plantList = Plant.plantList;
  List<Plant> favorites = [];
  List<Plant> myCart = [];

  int _bottomNavIndex = 0;

  List<Widget> _widgetOptions() {
    return [
      HomePage(plantList: plantList,),
      FavoritePage(favoritePlants: favorites,),
      CartPage(addedToCartPlants: myCart),
      const ProfilePage(),
    ];
  }

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person
  ];
  List<String> titleList = [
    "Home",
    "Favorite",
    "Cart",
    "Profile"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleList[_bottomNavIndex], style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 24
            ),),
            const Icon(Icons.notifications, color: Colors.black, size: 30,)
          ],
        ),
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, PageTransition(child: const Scanpage(), type: PageTransitionType.bottomToTop));
        },
        backgroundColor: Constants.primaryColor,
        child: Image.asset("assets/images/code-scan-two.png", height: 30.0,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
            final List<Plant> favoritePlants = Plant.getFavoritedPlants();
            final List<Plant> addedToCartPlants = Plant.addedToCartPlants();

            favorites = favoritePlants;
            myCart = addedToCartPlants.toSet().toList();
          });
        },
      ),
    );
  }
}
