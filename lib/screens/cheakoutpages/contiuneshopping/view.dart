import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodapp/component/buttonitem.dart';
import 'package:foodapp/screens/homepage/view.dart';
import 'package:foodapp/screens/navigationbar/view.dart';

class ContiuneShoppingScreen extends StatelessWidget {
  const ContiuneShoppingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.shortestSide * .05,
          vertical: size.longestSide * .05,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(
                height: size.longestSide * .35,
                image: const AssetImage("images/food2.jpg"),
                fit: BoxFit.fill,
              ),
              const Spacer(flex: 1),
              Text(
                "Your order has been placed successfully",
                style: TextStyle(
                    fontSize: size.shortestSide * .08,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Text(
                "Your item has been placed and is on its way to beging processed",
                style: TextStyle(
                    fontSize: size.shortestSide * .053,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              const Spacer(
                flex: 3,
              ),
              ButtonItem(
                name: "Continue Shopping",
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NavigationBarScreen()),
                      (route) => false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
