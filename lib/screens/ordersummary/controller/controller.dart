import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/component/sheetitem.dart';
import 'package:foodapp/screens/favoritelist/controller/controller.dart';
import 'states.dart';

class OrderSummaryController extends Cubit<OrderSummaryStates> {
  List<FavoriteContent> favorite = [
    FavoriteContent(
        img: "images/food1.webp",
        name: "name 1",
        price: 1.99,
        type: "1 Kg, india",
        number: 1),
    FavoriteContent(
        img: "images/food2.jpg",
        name: "name 2",
        price: 5.99,
        type: "1 Kg, india",
        number: 1),
    FavoriteContent(
        img: "images/food3.jpg",
        name: "name 3",
        price: 0.99,
        type: "1 Kg, india",
        number: 1),
    FavoriteContent(
        img: "images/food11.jpg",
        name: "name 4",
        price: 3.99,
        type: "1 Kg, india",
        number: 1),
  ];
  static OrderSummaryController get(context) => BlocProvider.of(context);
  OrderSummaryController() : super(OrderSummaryInitialState());
  void add(int i) {
    favorite[i].number++;
    emit(OrderSummaryAddingState());
  }

  void minus(int i) {
    if (favorite[i].number > 1) {
      favorite[i].number--;
    }
    emit(OrderSummaryMinusState());
  }

  void remove(int i) {
    favorite.removeAt(i);
    emit(OrderSummaryDeletState());
  }

  List<Content> listItem = [
    Content(desc: "Select Method & Time", head: "Delivery"),
    Content(desc: "Select Method", head: "Payment"),
    Content(desc: "Pick discount", head: "Promo Code"),
    Content(desc: "\$13.97", head: "Total Cost", isMainColor: true),
  ];
}

class Content {
  final String? head;
  final String? desc;
  bool? isMainColor;

  Content({this.head, this.desc, this.isMainColor = false});
}
