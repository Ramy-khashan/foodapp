import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodapp/screens/favoritelist/view.dart';
import 'package:foodapp/screens/homepage/view.dart';
import 'package:foodapp/screens/navigationbar/controller.dart';
import 'package:foodapp/screens/navigationbar/states.dart';
import 'package:foodapp/screens/order/view.dart';
import 'package:foodapp/screens/ordersummary/view.dart';
import 'package:foodapp/screens/recipespages/collectingingredientpages/collectingingredientpages.dart';

import '../constcolor.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => NavigationBarController(),
      child: BlocConsumer<NavigationBarController, NavigationBarStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final controller = NavigationBarController.get(context);
          return Scaffold(
            body: Center(
              child:
                  controller.widgetOptions.elementAt(controller.selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.home), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.cocktail), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_outline_outlined), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.user), label: "")
              ],
              iconSize: size.shortestSide * .07,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.grey.shade100,
              unselectedItemColor: Colors.black,
              elevation: 0,
              currentIndex: controller.selectedIndex,
              selectedItemColor: mainColor,
              unselectedFontSize: 0,
              selectedFontSize: 0,
              onTap: controller.onTap,
            ),
          );
        },
      ),
    );
  }
}
