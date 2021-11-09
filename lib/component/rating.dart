import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int? rate;
  const RatingItem({Key? key, this.rate = 3}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: List.generate(
          5,
          (index) => Icon(
                Icons.star_rate,
                size: size.shortestSide * .07,
                color: index < int.parse(rate.toString())
                    ? Colors.yellow.shade500
                    : null,
              )),
    );
  }
}
