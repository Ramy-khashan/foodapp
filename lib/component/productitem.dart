import 'package:flutter/material.dart';
import 'package:foodapp/screens/constcolor.dart';

class ProductItem extends StatelessWidget {
  final String? img;
  const ProductItem({Key? key, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.shortestSide * .05),
      child: Stack(
        children: [
          Column(
            children: [
              const Spacer(),
              Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 9,
                          color: Colors.grey.shade300,
                          spreadRadius: 3)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                width: size.shortestSide * .4,
                height: size.longestSide * .27,
                padding:
                    EdgeInsets.symmetric(horizontal: size.shortestSide * .04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Chicken",
                        style: TextStyle(
                            fontSize: size.shortestSide * .05,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: size.longestSide * .005,
                    ),
                    Text(
                      "1Kg, With skin",
                      style: TextStyle(fontSize: size.shortestSide * .038),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: size.longestSide * .005),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$3.14",
                            style: TextStyle(
                                fontSize: size.shortestSide * .055,
                                fontWeight: FontWeight.bold),
                          ),
                          Card(
                            color: mainColor,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                "+",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.shortestSide * .08,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: size.shortestSide * .06,
            child: CircleAvatar(
              radius: size.shortestSide * .14,
              backgroundImage: const AssetImage("images/food2.jpg"),
              backgroundColor: mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
