import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/component/buttonitem.dart';
import 'package:foodapp/component/ingredientadditem.dart';
import 'package:foodapp/component/plusandminus.dart';
import 'package:foodapp/screens/recipespages/ingredients/controller/controller.dart';

class IngredientsScreen extends StatefulWidget {
  const IngredientsScreen({Key? key}) : super(key: key);

  @override
  State<IngredientsScreen> createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  final controller = IngredientsController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.shortestSide * .06,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "images/food11.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Text(
                    "Serving",
                    style: TextStyle(
                        fontSize: size.shortestSide * .06,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: size.shortestSide * .08),
                  PlusAndMinusItem(
                    add: () {
                      setState(() {});
                      controller.add(controller.number);
                    },
                    number: controller.number,
                    minus: () {
                      setState(() {});
                      controller.minus(controller.number);
                    },
                  ),
                ],
              ),
            ),
            Column(
              children: List.generate(
                  controller.ingredientAdd.length,
                  (i) => IngredientAddItem(
                        size: size,
                        onPressed: (val) {
                          controller.cheakRequire(i, val);
                          setState(() {});
                        },
                        ingredient: controller.ingredientAdd[i].ingredient,
                        value: controller.ingredientAdd[i].isCorrect,
                      )),
            ),
            const Spacer(
              flex: 1,
            ),
            ButtonItem(
              name: "Shop ingerdients",
              onPressed: () {},
            ),
            SizedBox(height: size.longestSide * .02),
          ],
        ),
      ),
    );
  }
}
