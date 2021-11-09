import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/screens/favoritelist/view.dart';
import 'package:foodapp/screens/homepage/view.dart';
import 'package:foodapp/screens/order/view.dart';
import 'package:foodapp/screens/ordersummary/view.dart';
import 'package:foodapp/screens/recipes/recipes.dart';
import 'package:foodapp/screens/recipespages/collectingingredientpages/collectingingredientpages.dart';

import 'states.dart';

class NavigationBarController extends Cubit<NavigationBarStates> {
  int selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  var widgetOptions = [
    HomePageScreen(),
    RecipesScreen(),
    const FavoriteListScreen(),
    OrderSummaryScreen(),
    OrderScreen(),
  ];

  NavigationBarController() : super(InitialNavigationBarState());
  static NavigationBarController get(context) => BlocProvider.of(context);
  void onTap(int index) {
    selectedIndex = index;
    emit(ChangeIndexNavigationBarState());
  }
}
