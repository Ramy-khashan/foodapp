import 'package:flutter/material.dart';
import 'package:foodapp/screens/constcolor.dart';

class FoodItem extends StatelessWidget {
  final String? img;
  final String? name;

  const FoodItem({Key? key, this.img, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: size.shortestSide * .04,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: AssetImage(img!), fit: BoxFit.fill),
      ),
      height: size.longestSide * .12,
      width: size.shortestSide * .22,
      child: Container(
        decoration: const BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
        ),
        margin: EdgeInsets.only(top: size.longestSide * .1),
        child: const Center(
            child: Text(
          "data",
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
