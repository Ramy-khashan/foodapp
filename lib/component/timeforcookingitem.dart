import 'package:flutter/material.dart';

class TimeForCookingItem extends StatelessWidget {
  final int? time;
  final Size? size;
  final String? cookState;

  const TimeForCookingItem({Key? key, this.cookState, this.time, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$cookState",
          style: TextStyle(
              fontSize: size!.shortestSide * .04, fontWeight: FontWeight.w800),
        ),
        SizedBox(
          height: size!.longestSide * .01,
        ),
        Text(
          "$time min",
          style: TextStyle(
              fontSize: size!.shortestSide * .035, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
