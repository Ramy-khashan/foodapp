import 'package:flutter/material.dart';
import 'package:foodapp/screens/constcolor.dart';

class Dotitem extends StatelessWidget {
  final int? indexChange;
  final int? length;
  const Dotitem({Key? key, this.indexChange, this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        int.parse(length.toString()),
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          margin: EdgeInsets.symmetric(horizontal: size.shortestSide * .005),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: int.parse(indexChange.toString()) == index
                ? mainColor
                : Colors.grey,
          ),
          height: size.longestSide * .012,
          width: int.parse(indexChange.toString()) == index
              ? size.shortestSide * .08
              : size.shortestSide * .025,
        ),
      ),
    );
  }
}
