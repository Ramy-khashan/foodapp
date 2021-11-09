import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/component/orderitem.dart';
import 'package:foodapp/screens/constcolor.dart';
import 'package:foodapp/screens/order/controller/controller.dart';

class OrderScreen extends StatelessWidget {
  final controller = OrderController();

  OrderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              "Order",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: mainColor,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  child: Text(
                    "Ongoing",
                    style: TextStyle(
                        fontSize: size.shortestSide * .05, color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "History",
                    style: TextStyle(
                        fontSize: size.shortestSide * .05, color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          body: BlocProvider(
            create: (context) => OrderController(),
            child: TabBarView(
              children: [
                SizedBox(
                  height: size.longestSide,
                  child: ListView.builder(
                    itemBuilder: (context, i) {
                      return OrderItem(
                        dateTime: controller.orderList[i].dateTime,
                        isCorrect: controller.orderList[i].isCorrect,
                        name: controller.orderList[i].name,
                      );
                    },
                    itemCount: 4,
                    physics: const BouncingScrollPhysics(),
                  ),
                ),
                SizedBox(
                  height: size.longestSide,
                  child: ListView.builder(
                    itemBuilder: (context, i) {
                      return OrderItem(
                        isGoing: false,
                        dateTime: controller.orderList[i].dateTime,
                        isCorrect: controller.orderList[i].isCorrect,
                        name: controller.orderList[i].name,
                      );
                    },
                    itemCount: 4,
                    physics: const BouncingScrollPhysics(),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
