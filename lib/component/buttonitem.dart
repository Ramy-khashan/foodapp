import 'package:flutter/material.dart';
import 'package:foodapp/screens/constcolor.dart';

class ButtonItem extends StatelessWidget {
  final Function()? onPressed;
  final String? name;
  const ButtonItem({
    Key? key,
    this.name,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          name.toString(),
          style:
              TextStyle(fontSize: size.shortestSide * .05, color: Colors.white),
        ),
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: size.longestSide * .025)),
            backgroundColor: MaterialStateProperty.all(mainColor)),
      ),
    );
  }
}
