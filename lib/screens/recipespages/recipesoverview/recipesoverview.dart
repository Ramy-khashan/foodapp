import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:foodapp/component/descriptionitem.dart';
import 'package:foodapp/component/timeforcookingitem.dart';
import 'package:foodapp/screens/recipespages/recipesoverview/controller/controller.dart';

class RecipesOverviewScreen extends StatelessWidget {
  final controller = RecipesOverviewController();

  RecipesOverviewScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: size.shortestSide * .065),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "images/food2.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: size.longestSide * .04,
            ),
            Text(
              controller.recipesDescription,
              style: TextStyle(
                  fontSize: size.shortestSide * .043,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: size.longestSide * .04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                controller.cookStage.length,
                (index) => TimeForCookingItem(
                  size: size,
                  cookState: controller.cookStage[index]["type"],
                  time: controller.cookStage[index]["time"],
                ),
              ),
            ),
            SizedBox(
              height: size.longestSide * .04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(2, (index) {
                return DescriptionItem(
                  size: size,
                  head: controller.cookInfo[index]['type'],
                  info: controller.cookInfo[index]['kind'],
                );
              }),
            ),
            SizedBox(
              height: size.longestSide * .04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(2, (index) {
                return DescriptionItem(
                  size: size,
                  head: controller.cookInfo[index + 2]['type'],
                  info: controller.cookInfo[index + 2]['kind'],
                );
              }),
            ),
            SizedBox(height: size.longestSide * .03),
          ],
        ),
      ),
    );
  }
}
