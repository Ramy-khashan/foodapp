import 'package:flutter/material.dart';
import 'package:foodapp/screens/constcolor.dart';

class PlusAndMinusItem extends StatelessWidget {
  final Function()? add;
  final Function()? minus;
  final int number;
  const PlusAndMinusItem({Key? key, this.add, this.minus, this.number = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 35,
      decoration: BoxDecoration(
          color: mainColor, borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          IconButton(
            onPressed: minus,
            icon: Icon(
              Icons.remove,
              color: Colors.white,
              size: size.shortestSide * .05,
            ),
          ),
          FittedBox(
            child: Text(
              "$number",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
              onPressed: add,
              icon: Icon(
                Icons.add,
                size: size.shortestSide * .05,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
