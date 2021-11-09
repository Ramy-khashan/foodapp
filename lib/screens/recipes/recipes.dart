import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/component/fooditem.dart';
import 'package:foodapp/component/headeritem.dart';
import 'package:foodapp/component/headstart.dart';
import 'package:foodapp/component/searchitem.dart';
import 'package:foodapp/screens/constcolor.dart';
import 'package:foodapp/screens/recipespages/collectingingredientpages/collectingingredientpages.dart';
import 'controller/controller.dart';

class RecipesScreen extends StatelessWidget {
  RecipesScreen({Key? key}) : super(key: key);
  final controller = RecipesController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadStartWithNotification(
                headname: "Choose Your on\nfrom 1000+ for Recipes!",
                notificationMethod: () {},
              ),
              SearchItem(
                filterMethod: () {},
                controller: controller.controllerText,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: size.shortestSide * .05),
                child: const HeaderItem(
                  name: "Categories",
                  textButtonName: "See All",
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: size.shortestSide * .04),
                height: size.longestSide * .15,
                child: ListView.builder(
                  itemBuilder: (context, i) {
                    return FoodItem(
                      img: controller.categoriesimgs[i],
                    );
                  },
                  physics: const BouncingScrollPhysics(),
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: size.shortestSide * .05),
                child: HeaderItem(
                  name: "Product Recipes",
                  textButtonName: "See All",
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const CollectingIngredientPagesScreen(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: size.longestSide * .3,
                padding: EdgeInsets.only(bottom: size.longestSide * .025),
                margin: EdgeInsets.symmetric(
                    horizontal: size.shortestSide * .04,
                    vertical: size.longestSide * .02),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: AssetImage(controller.categoriesimgs[3]),
                        fit: BoxFit.fill)),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      2,
                      (index) => Container(
                        padding: EdgeInsets.symmetric(
                            vertical: size.longestSide * .02,
                            horizontal: size.shortestSide * .05),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          controller.info[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.shortestSide * .04),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Oats porridge\t\t",
                        style: TextStyle(
                            fontSize: size.shortestSide * .06,
                            fontWeight: FontWeight.bold),
                      ),
                      WidgetSpan(
                        child: Card(
                          color: mainColor,
                          child: Padding(
                            padding: EdgeInsets.all(size.shortestSide * .01),
                            child: Text(
                              "new",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.shortestSide * .035),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.shortestSide * .04),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: size.shortestSide * .04),
                    children: const [
                      TextSpan(
                        text: "Breakfastt\t\t",
                      ),
                      WidgetSpan(
                          child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 2,
                      )),
                      TextSpan(
                        text: "American\t\t",
                      ),
                      WidgetSpan(
                          child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 2,
                      )),
                      TextSpan(
                        text: "Vegetarian",
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: size.longestSide * .3,
                margin: EdgeInsets.symmetric(
                    horizontal: size.shortestSide * .04,
                    vertical: size.longestSide * .02),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: AssetImage(controller.categoriesimgs[0]),
                        fit: BoxFit.fill)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
