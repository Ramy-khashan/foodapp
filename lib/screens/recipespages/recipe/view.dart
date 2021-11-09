import 'dart:ui';

import 'package:flutter/material.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Text(
          "Empty Yet",
          style: TextStyle(
              fontSize: size.shortestSide * .15,
              fontWeight: FontWeight.w900,
              color: Colors.grey.shade300),
        ),
      ),
    );
  }
}
