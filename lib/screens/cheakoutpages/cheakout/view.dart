import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:foodapp/component/buttonitem.dart';
import 'package:foodapp/component/dayitem.dart';
import 'package:foodapp/component/deliverymethoditem.dart';
import 'package:foodapp/component/headeritem.dart';
import 'package:foodapp/screens/cheakoutpages/cheakout/controller/controller.dart';
import 'package:foodapp/screens/cheakoutpages/contiuneshopping/view.dart';
import 'package:foodapp/screens/constcolor.dart';

class CheakoutScreen extends StatefulWidget {
  const CheakoutScreen({Key? key}) : super(key: key);

  @override
  State<CheakoutScreen> createState() => _CheakoutScreenState();
}

class _CheakoutScreenState extends State<CheakoutScreen> {
  final controller = CheakoutController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: size.longestSide * .03,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Cheakout",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.shortestSide * .05),
            child: const HeaderItem(
              name: "Delivery Address",
              textButtonName: "change",
            ),
          ),
          Card(
            elevation: 0,
            margin: EdgeInsets.symmetric(horizontal: size.shortestSide * .05),
            child: Padding(
              padding: EdgeInsets.all(size.shortestSide * .05),
              child: Text.rich(TextSpan(children: [
                const TextSpan(
                    text: "Name\n",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                WidgetSpan(
                    child: Divider(
                  indent: size.shortestSide * .03,
                )),
                const TextSpan(text: "\nisue\n"),
                WidgetSpan(
                    child: Divider(
                  indent: size.shortestSide * .03,
                )),
                const TextSpan(text: "\nphone number")
              ])),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.shortestSide * .05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery Time",
                  style: TextStyle(
                      fontSize: size.shortestSide * .048,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  "Month",
                  style: TextStyle(
                      color: Colors.black, fontSize: size.shortestSide * .04),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                )
              ],
            ),
          ),
          SizedBox(
            height: size.longestSide * .13,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    31,
                    (index) => DaysITem(
                          i: index,
                          size: size,
                          chossenOne: DateTime.now().day,
                        )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.shortestSide * .05,
            ),
            child: Row(
              children: [
                Text(
                  "Time",
                  style: TextStyle(
                      fontSize: size.shortestSide * .048,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "04 : 52",
                      style: TextStyle(
                          fontSize: size.shortestSide * .04,
                          color: Colors.black),
                    ),
                  ),
                ),
                Card(
                  child: Row(
                    children: [
                      Card(
                          margin: EdgeInsets.zero,
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              "AM",
                              style: TextStyle(
                                  fontSize: size.shortestSide * .04,
                                  color: controller.isnight
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                          color: controller.isnight ? null : mainColor),
                      Card(
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "PM",
                            style: TextStyle(
                                fontSize: size.shortestSide * .04,
                                color: controller.isnight
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                        color: controller.isnight ? mainColor : null,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.shortestSide * .05),
            child: Text(
              "Delivery method",
              style: TextStyle(
                  fontSize: size.shortestSide * .048,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: size.longestSide * .01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.shortestSide * .05),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      DeliveryMethodITem(
                          group: controller.group,
                          value: 1,
                          size: size,
                          name: "Door Delivery",
                          onChange: (x) {
                            setState(() {});

                            controller.group = int.parse(x.toString());
                          }),
                      Divider(
                        height: size.longestSide * .04,
                        thickness: 2,
                        color: Colors.grey.withOpacity(.6),
                      ),
                      DeliveryMethodITem(
                          group: controller.group,
                          value: 2,
                          size: size,
                          name: "Pick Up",
                          onChange: (x) {
                            setState(() {});

                            controller.group = int.parse(x.toString());
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.longestSide * .02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.shortestSide * .05),
            child: ButtonItem(
              name: "Cheakout",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContiuneShoppingScreen()));
              },
            ),
          ),
          SizedBox(
            height: size.longestSide * .015,
          ),
        ],
      ),
    );
  }
}
