import 'package:flutter/material.dart';
import 'package:foodapp/screens/constcolor.dart';

// ignore: must_be_immutable
class DeliveryMethodITem extends StatelessWidget {
  final String? name;
  final int? value;
  final Size? size;
  int? group;
  Function(dynamic c)? onChange;

  DeliveryMethodITem(
      {Key? key, this.size, this.name, this.onChange, this.group, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
            fillColor:
                group == value ? MaterialStateProperty.all(mainColor) : null,
            value: int.parse(value.toString()),
            groupValue: group,
            onChanged: (value) {
              onChange!(value);
            }),
        Text(
          name.toString(),
          style: TextStyle(fontSize: size!.shortestSide * .045),
        ),
      ],
    );
  }
}
