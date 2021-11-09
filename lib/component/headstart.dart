import 'package:flutter/material.dart';

class HeadStartWithNotification extends StatelessWidget {
  final String? headname;
  final Function()? notificationMethod;
  const HeadStartWithNotification(
      {Key? key, this.headname, this.notificationMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.shortestSide * .05,
          vertical: size.longestSide * .02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headname.toString(),
            style: TextStyle(
                fontSize: size.shortestSide * .065,
                fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.notifications_none_outlined,
            size: size.shortestSide * .09,
          ),
        ],
      ),
    );
  }
}
