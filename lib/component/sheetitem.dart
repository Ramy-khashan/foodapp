import 'package:flutter/material.dart';
import 'package:foodapp/screens/constcolor.dart';

class SheetItem extends StatelessWidget {
  final String? head;
  final String? description;
  final Size? size;
  bool? isMainColor;
  SheetItem(
      {this.isMainColor = false,
      this.description,
      this.head,
      this.size,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          head!,
          style: TextStyle(
              fontSize: size!.shortestSide * .045, fontWeight: FontWeight.w500),
        ),
        Spacer(),
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              size: size!.shortestSide * .04,
              color: Colors.black,
            ),
            label: Text(
              description!,
              style: TextStyle(
                  fontSize: isMainColor!
                      ? size!.shortestSide * .05
                      : size!.shortestSide * .034,
                  color: isMainColor! ? mainColor : Colors.grey.shade500),
            ),
          ),
        ),
      ],
    );
  }
}
