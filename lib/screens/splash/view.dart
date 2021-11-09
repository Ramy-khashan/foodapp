import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodapp/screens/constcolor.dart';
import 'package:foodapp/screens/onboard/view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => OnBoardScreen()),
              (route) => false,
            )).tick;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: size.shortestSide * .3),
            child: Icon(
              FontAwesomeIcons.carrot,
              color: mainColor,
              size: size.shortestSide * .5,
            ),
          ),
          SizedBox(
            height: size.longestSide * .07,
          ),
          Padding(
            padding: EdgeInsets.only(left: size.shortestSide * .2),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: "GROCERY",
                  style: TextStyle(
                      color: mainColor,
                      fontSize: size.shortestSide * .08,
                      fontWeight: FontWeight.w800)),
              TextSpan(
                  text: "US",
                  style: TextStyle(
                      color: mainColor.withOpacity(.5),
                      fontSize: size.shortestSide * .08,
                      fontWeight: FontWeight.w800))
            ])),
          )
        ],
      ),
    );
  }
}
