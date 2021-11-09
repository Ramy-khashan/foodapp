import 'package:flutter/material.dart';
import 'package:foodapp/screens/constcolor.dart';
import 'package:foodapp/screens/recipespages/collectingingredientpages/controller/controller.dart';
import 'package:foodapp/screens/recipespages/ingredients/ingredients.dart';
import 'package:foodapp/screens/recipespages/ingredientvideo/ingredientvideo.dart';
import 'package:foodapp/screens/recipespages/recipe/view.dart';
import 'package:foodapp/screens/recipespages/recipesoverview/recipesoverview.dart';

class CollectingIngredientPagesScreen extends StatefulWidget {
  const CollectingIngredientPagesScreen({Key? key}) : super(key: key);

  @override
  State<CollectingIngredientPagesScreen> createState() =>
      _CollectingIngredientPagesScreenState();
}

class _CollectingIngredientPagesScreenState
    extends State<CollectingIngredientPagesScreen> {
  final controller = CollectingIngredientPagesController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: SafeArea(
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: size.shortestSide * .04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: size.shortestSide * .05,
                        )),
                    Row(
                      children: [
                        Text(
                          "Oats porridge recipe",
                          style: TextStyle(
                            fontSize: size.shortestSide * .06,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              controller.isFav = !controller.isFav;
                              setState(() {});
                            },
                            icon: Icon(
                              controller.isFav
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: controller.isFav ? mainColor : Colors.grey,
                              size: size.shortestSide * .08,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            toolbarHeight: size.longestSide * .13,
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.grey.shade600,
              labelColor: Colors.grey,
              indicatorColor: mainColor,
              indicator: UnderlineTabIndicator(
                borderSide: const BorderSide(color: mainColor, width: 2),
                insets: EdgeInsets.only(
                  left: size.shortestSide * .04,
                  right: size.shortestSide * .04,
                  bottom: size.longestSide * .06,
                ),
              ),
              automaticIndicatorColorAdjustment: false,
              tabs: [
                Tab(
                  child: FittedBox(
                      child: Text(
                    "Overview",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.shortestSide * .045),
                  )),
                ),
                Tab(
                  child: FittedBox(
                      child: Text("Ingredients",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: size.shortestSide * .045))),
                ),
                Tab(
                  child: FittedBox(
                      child: Text("Video",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: size.shortestSide * .045))),
                ),
                Tab(
                  child: FittedBox(
                      child: Text("Recipe",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: size.shortestSide * .045))),
                ),
              ],
            ),
          ),
          body: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: [
              RecipesOverviewScreen(),
              const IngredientsScreen(),
              IngredientVideoScreen(),
              const RecipeScreen()
            ],
          ),
        ),
      ),
    );
  }
}
