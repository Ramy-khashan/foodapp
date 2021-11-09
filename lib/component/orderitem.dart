import 'package:flutter/material.dart';
import 'package:foodapp/screens/constcolor.dart';

class OrderItem extends StatelessWidget {
  final bool isGoing;
  final String? name;
  final String? dateTime;
  final bool isCorrect;
  const OrderItem(
      {Key? key,
      this.dateTime,
      this.isCorrect = true,
      this.name,
      this.isGoing = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.longestSide * .16,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(
        vertical: size.longestSide * .015,
        horizontal: size.shortestSide * .05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            color: mainColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: size.shortestSide * .08,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: size.longestSide * .11,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name.toString(),
                  style: TextStyle(
                    fontSize: size.shortestSide * .055,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                isGoing
                    ? Text("Waiting",
                        style: TextStyle(
                          fontSize: size.shortestSide * .04,
                        ))
                    : Text(
                        isCorrect ? "Delivered" : "Cancelled",
                        style: TextStyle(
                            fontSize: size.shortestSide * .04,
                            color: isCorrect ? Colors.green : Colors.red),
                      ),
                Text(
                  "DateTime",
                  style: TextStyle(
                    fontSize: size.shortestSide * .045,
                    color: Colors.grey.shade400,
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "\$14.55",
                style: TextStyle(
                    fontSize: size.shortestSide * .055,
                    color: Colors.red.shade600),
              ),
              isGoing
                  ? const Text("")
                  : CircleAvatar(
                      backgroundImage: isCorrect
                          ? const AssetImage("images/correct.PNG")
                          : const AssetImage("images/wrong.PNG"),
                      radius: size.shortestSide * .04,
                    ),
            ],
          )
        ],
      ),
    );
  }
}
