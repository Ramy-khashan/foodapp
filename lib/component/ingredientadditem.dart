import 'package:flutter/material.dart';
import 'package:foodapp/screens/constcolor.dart';

// ignore: must_be_immutable
class IngredientAddItem extends StatelessWidget {
  IngredientAddItem(
      {Key? key, this.value, this.onPressed, this.ingredient, this.size})
      : super(key: key);
  final String? ingredient;
  final Size? size;
  bool? value;
  final Function(bool? val)? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: mainColor,
          splashRadius: .9,
          side: const BorderSide(color: mainColor),
          value: value,
          onChanged: (val) => onPressed!(val),
        ),
        SizedBox(
          width: size!.shortestSide * .05,
        ),
        Text(
          "$ingredient",
          style: TextStyle(fontSize: size!.shortestSide * .052),
        ),
      ],
    );
  }
}
