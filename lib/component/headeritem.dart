import 'package:flutter/material.dart';
import 'package:foodapp/screens/constcolor.dart';

class HeaderItem extends StatelessWidget {
  final String? name;
  final String? textButtonName;
  final Function()? onPress;
  const HeaderItem({Key? key, this.name, this.textButtonName, this.onPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name.toString(),
          style: TextStyle(
              fontSize: size.shortestSide * .048, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onPress,
          child: Text(
            textButtonName.toString(),
            style:
                TextStyle(fontSize: size.shortestSide * .04, color: mainColor),
          ),
        ),
      ],
    );
  }
}
