import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/screens/favoritelist/controller/states.dart';

class FavoriteListController extends Cubit<FavoritStates> {
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
  static FavoriteListController get(context) => BlocProvider.of(context);
  FavoriteListController() : super(InitialFavoritState());
  void add(int i) {
    favorite[i].number++;
    emit(AddingFavoritState());
  }

  void minus(int i) {
    if (favorite[i].number > 1) {
      favorite[i].number--;
    }
    emit(MinusFavoritState());
  }

  void remove(int i) {
    favorite.removeAt(i);
    emit(DeleteFavoritState());
  }
}

class FavoriteContent {
  final String? img;
  final String? name;
  final String? type;
  final double? price;
  int number;

  FavoriteContent(
      {this.name, this.type, this.price, this.img, this.number = 1});
}
