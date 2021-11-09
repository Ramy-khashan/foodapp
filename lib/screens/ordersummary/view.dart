import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/component/buttonitem.dart';
import 'package:foodapp/component/favoriteitem.dart';
import 'package:foodapp/component/sheetitem.dart';
import 'package:foodapp/screens/cheakoutpages/cheakout/view.dart';
import 'package:foodapp/screens/ordersummary/controller/states.dart';

import 'controller/controller.dart';

class OrderSummaryScreen extends StatelessWidget {
  OrderSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => OrderSummaryController(),
      child: BlocConsumer<OrderSummaryController, OrderSummaryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final controller = OrderSummaryController.get(context);
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: const Text(
                  "Order Summary",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, i) {
                        return FavoriteItem(
                          img: controller.favorite[i].img,
                          name: controller.favorite[i].name,
                          price: controller.favorite[i].price,
                          type: controller.favorite[i].type,
                          add: () => controller.add(i),
                          minus: () => controller.minus(i),
                          number: controller.favorite[i].number,
                        );
                      },
                      itemCount: controller.favorite.length,
                      physics: const BouncingScrollPhysics(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: size.shortestSide * .05),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ButtonItem(
                            name: "Cheakout",
                            onPressed: () {
                              showModalBottomSheet(
                                isDismissible: false,
                                context: context,
                                builder: (context) {
                                  return Container(
                                    margin:
                                        EdgeInsets.all(size.shortestSide * .03),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Cheakout",
                                                style: TextStyle(
                                                    fontSize:
                                                        size.shortestSide * .06,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const Spacer(),
                                              IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(Icons.close,
                                                    size: size.shortestSide *
                                                        .07),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.longestSide * .36,
                                            child: ListView.separated(
                                                itemBuilder: (context, index) =>
                                                    SheetItem(
                                                        description: controller
                                                            .listItem[index]
                                                            .desc,
                                                        head: controller
                                                            .listItem[index]
                                                            .head,
                                                        size: size,
                                                        isMainColor: controller
                                                            .listItem[index]
                                                            .isMainColor),
                                                separatorBuilder:
                                                    (context, index) =>
                                                        const Divider(),
                                                itemCount:
                                                    controller.listItem.length),
                                          ),
                                          Row(
                                            children: [
                                              Checkbox(
                                                value: true,
                                                onChanged: (val) {},
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "By placing an order you agree to our",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.shortestSide *
                                                                .045),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: Text(
                                                      "Term And Conditions.",
                                                      style: TextStyle(
                                                          fontSize:
                                                              size.shortestSide *
                                                                  .047,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(
                                                size.shortestSide * .03),
                                            child: ButtonItem(
                                              name: "Place Order",
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            CheakoutScreen()));
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Card(
                            margin: EdgeInsets.only(
                                right: size.shortestSide * .08,
                                top: size.longestSide * .02),
                            color: Colors.amber.shade300,
                            child: Padding(
                              padding: EdgeInsets.all(size.shortestSide * .015),
                              child: Text("23.5\$"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: size.longestSide * .01)
                ],
              ));
        },
      ),
    );
  }
}
