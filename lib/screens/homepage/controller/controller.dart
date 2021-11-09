import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';

class HomePageController extends Cubit<HomePageStates> {
  TextEditingController? controllerText;

  HomePageController() : super(InitialState());
  static HomePageController get(context) => BlocProvider.of(context);
  List<String> categoriesimgs = [
    "images/food1.webp",
    "images/food2.jpg",
    "images/food3.jpg",
    "images/food11.jpg",
    "images/food1.webp",
    "images/food2.jpg",
    "images/food3.jpg",
    "images/food11.jpg",
    "images/food1.webp",
    "images/food2.jpg",
    "images/food3.jpg",
    "images/food11.jpg",
    "images/food1.webp",
    "images/food2.jpg",
  ];
  int selectedIndex = 0;
  List<String> popularFood = [
    "images/food1.webp",
    "images/food2.jpg",
    "images/food3.jpg",
    "images/food11.jpg",
    "images/food1.webp",
    "images/food2.jpg",
    "images/food3.jpg",
    "images/food11.jpg",
    "images/food1.webp",
    "images/food2.jpg",
    "images/food3.jpg",
    "images/food11.jpg",
    "images/food1.webp",
    "images/food2.jpg",
  ];
}
