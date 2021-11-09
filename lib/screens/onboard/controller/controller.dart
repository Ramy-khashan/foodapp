import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/screens/onboard/controller/states.dart';

class OnBoardController extends Cubit<OnBoardStates> {
  int index = 0;
  List<Content> imgs = [
    Content(
        head: "Welcome to Groceryus",
        imgs: "images/food1.webp",
        subtitle: "1500+ Grocery items available\nonly for you."),
    Content(
        head: "Fresh Fruits",
        imgs: "images/food2.jpg",
        subtitle:
            "Fresh fruits from th fields\nare picked only to serve you fresh."),
    Content(
        head: "Easy Shopping",
        imgs: "images/food3.jpg",
        subtitle: "Easy and fast way of shopping\nto save you valiable time"),
    Content(
        head: "Fast Delivery",
        imgs: "images/food11.jpg",
        subtitle: "Very fast same day delivery and\ncustom delivery system"),
  ];

  OnBoardController() : super(InitialState());
  static OnBoardController get(context) => BlocProvider.of(context);

  void changePage(int val) {
    index = val;
    emit(ChangePageState());
  }

  void changePageButton(context) {
    index++;
    emit(ChangeButtonState());
  }
}

class Content {
  final String? imgs;
  final String? head;
  final String? subtitle;
  Content({this.head, this.imgs, this.subtitle});
}
