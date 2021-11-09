import 'package:flutter/material.dart';
import 'package:foodapp/screens/constcolor.dart';

class DaysITem extends StatelessWidget {
  final int? i;
  final int? chossenOne;
  Color color = const Color(0xff2596be);
  final Size? size;
  DaysITem({Key? key, this.size, this.i, this.chossenOne}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: size!.shortestSide * .04),
        padding: EdgeInsets.symmetric(
            horizontal: size!.shortestSide * .04,
            vertical: size!.longestSide * .02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: i! + 1 == chossenOne ? mainColor : Colors.transparent,
        ),
        child: Column(
          children: [
            Text(
              "day\n",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: size!.shortestSide * .04,
                  color: i! + 1 == chossenOne ? Colors.white : Colors.black),
            ),
            Text("${i! + 1}",
                style: TextStyle(
                    fontSize: size!.shortestSide * .042,
                    fontWeight: FontWeight.w500,
                    color: i! + 1 == chossenOne ? Colors.white : Colors.black))
          ],
        ));
  }
}
