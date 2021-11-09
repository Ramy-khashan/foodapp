import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/screens/order/controller/states.dart';

class OrderController extends Cubit<OrderStates> {
  OrderController() : super(InitialOrderState());
  static OrderController get(context) => BlocProvider.of(context);
  List<OrderContent> orderList = [
    OrderContent(dateTime: "DateTime", name: "name1", isCorrect: true),
    OrderContent(dateTime: "DateTime", name: "name2", isCorrect: true),
    OrderContent(dateTime: "DateTime", name: "name3", isCorrect: false),
    OrderContent(dateTime: "DateTime", name: "name4", isCorrect: false),
  ];
}

class OrderContent {
  final String? name;
  final String? dateTime;
  bool isCorrect;
  OrderContent({this.dateTime, this.isCorrect = true, this.name});
}
