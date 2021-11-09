import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:foodapp/component/buttonitem.dart';
import 'package:foodapp/screens/recipespages/ingredientvideo/controller/controller.dart';

class IngredientVideoScreen extends StatelessWidget {
  IngredientVideoScreen({Key? key}) : super(key: key);
  final controller = IngredientVideoController();
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
              child: Container(
                padding:
                    EdgeInsets.symmetric(vertical: size.longestSide * .095),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                      image: AssetImage(
                        "images/food3.jpg",
                      ),
                      fit: BoxFit.fill,
                    )),
                child: const CircleAvatar(
                  backgroundColor: Colors.black87,
                  child: Icon(Icons.play_arrow),
                ),
              ),
              // child: ClipRRect(
              //   borderRadius: BorderRadius.circular(25),
              //   child: Image.asset(
              //     "images/food3.jpg",
              //     fit: BoxFit.fill,
              //   ),
              // ),
            ),
            const Spacer(),
            Expanded(
              child: Text(
                "Oats porridge",
                style: TextStyle(
                    fontSize: size.shortestSide * .06,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              controller.description,
              style: TextStyle(
                  fontSize: size.shortestSide * .043,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(
              flex: 1,
            ),
            ButtonItem(
              name: "View more recipes",
              onPressed: () {},
            ),
            SizedBox(height: size.longestSide * .02),
          ],
        ),
      ),
    );
  }
}
