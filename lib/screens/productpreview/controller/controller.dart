import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/screens/productpreview/controller/states.dart';

class ProductPreviewController extends Cubit<ProductViewState> {
  bool isFavorite = true;

  int num = 1;
  int rate = 2;
  int index = 0;
  bool isExtend = true;
  double price = 1.88;
  String details = "1 Kg, indian";
  String expandedDescription =
      "Milk Is An Excellent Source Of Vitamins And Minerals, including Nutritions Of Concern,Which Are Under-Onsumed By Many Populations.";
  List<String> imgs = [
    "images/food1.webp",
    "images/food2.jpg",
    "images/food3.jpg",
    "images/food11.jpg",
  ];
  static ProductPreviewController get(context) => BlocProvider.of(context);

  ProductPreviewController() : super(InitialProductState());
  void plus() {
    num++;
    emit(AddingProductState());
  }

  void isCheakFavorite() {
    isFavorite = !isFavorite;
    emit(IsFavoriteProductState());
  }

  void isExtendedDescription() {
    isExtend = !isExtend;
    emit(IsExtendedProductState());
  }

  void minus() {
    if (num > 1) {
      num--;
    }
    emit(MinusProductState());
  }
}
