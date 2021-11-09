import 'package:flutter/material.dart';

class DescriptionItem extends StatelessWidget {
  final Size? size;
  const DescriptionItem({Key? key, this.head, this.info, this.size})
      : super(key: key);
  final String? head;
  final String? info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$head",
          style: TextStyle(fontSize: size!.shortestSide * .04),
        ),
        Text(
          "$info",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
