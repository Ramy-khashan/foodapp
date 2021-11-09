import 'package:flutter/material.dart';
import 'package:foodapp/component/plusandminus.dart';

class FavoriteItem extends StatelessWidget {
  final Function()? add;
  final Function()? minus;
  final int? number;
  final String? img;
  final String? name;
  final String? type;
  final double? price;

  const FavoriteItem(
      {Key? key,
      this.add,
      this.name,
      this.type,
      this.price,
      this.img,
      this.minus,
      this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.longestSide * .17,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(
        vertical: size.longestSide * .015,
        horizontal: size.shortestSide * .05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: size.longestSide * .12,
            width: size.shortestSide * .22,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("$img"), fit: BoxFit.fill),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 9,
                      color: Colors.blue.shade300.withOpacity(.3),
                      offset: const Offset(0, 3),
                      spreadRadius: 4)
                ]),
          ),
          FittedBox(
            child: Text.rich(TextSpan(children: [
              TextSpan(
                text: "$name\n",
                style: TextStyle(
                  fontSize: size.shortestSide * .055,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "$type\n",
                style: TextStyle(
                  fontSize: size.shortestSide * .04,
                ),
              ),
              TextSpan(
                text: "\$$price\n",
                style: TextStyle(
                  fontSize: size.shortestSide * .055,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ])),
          ),
          PlusAndMinusItem(
            add: add,
            minus: minus,
            number: int.parse(number.toString()),
          ),
        ],
      ),
    );
  }
}
