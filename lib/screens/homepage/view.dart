// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/component/fooditem.dart';
import 'package:foodapp/component/headeritem.dart';
import 'package:foodapp/component/headstart.dart';
import 'package:foodapp/component/productitem.dart';
import 'package:foodapp/component/searchitem.dart';
import 'package:foodapp/screens/constcolor.dart';
import 'package:foodapp/screens/favoritelist/view.dart';
import 'package:foodapp/screens/homepage/controller/controller.dart';
import 'package:foodapp/screens/order/view.dart';
import 'package:foodapp/screens/ordersummary/controller/controller.dart';
import 'package:foodapp/screens/ordersummary/view.dart';
import 'package:foodapp/screens/populardeals/view.dart';
import 'package:foodapp/screens/productpreview/view.dart';
import 'package:foodapp/screens/recipespages/collectingingredientpages/collectingingredientpages.dart';

import 'controller/states.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomePageController(),
      child: BlocConsumer<HomePageController, HomePageStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final contoller = HomePageController.get(context);
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(children: [
                    HeadStartWithNotification(
                      headname: "Hand pick fresh\nitem only for you",
                      notificationMethod: () {},
                    ),
                    SearchItem(
                      filterMethod: () {},
                      controller: contoller.controllerText,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.longestSide * .015,
                          horizontal: size.shortestSide * .05),
                      child: const HeaderItem(
                          name: "Categories", textButtonName: "See All"),
                    ),
                    SizedBox(
                      height: size.longestSide * .15,
                      child: ListView.builder(
                        itemBuilder: (context, i) {
                          return FoodItem(
                            img: contoller.categoriesimgs[i],
                          );
                        },
                        physics: const BouncingScrollPhysics(),
                        itemCount: contoller.categoriesimgs.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    Container(
                      height: size.longestSide * .2,
                      margin: EdgeInsets.symmetric(
                          horizontal: size.shortestSide * .05,
                          vertical: size.longestSide * .03),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            image: AssetImage("images/food2.jpg"),
                            fit: BoxFit.fill,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.shortestSide * .05),
                      child: HeaderItem(
                        name: "Product Deals",
                        textButtonName: "See All",
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PopularDealsScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.longestSide * .32,
                      child: ListView.builder(
                        itemBuilder: (context, i) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductPreviewScreen(
                                              i: i,
                                            )));
                              },
                              child: ProductItem(
                                img: contoller.popularFood[i],
                              ));
                        },
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                      ),
                    ),
                    SizedBox(height: size.longestSide * .02)
                  ]),
                ),
              ),
            );
          }),
    );
  }
}
