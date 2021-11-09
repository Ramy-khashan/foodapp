import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/component/buttonitem.dart';
import 'package:foodapp/component/dotitem.dart';
import 'package:foodapp/screens/navigationbar/view.dart';
import 'package:foodapp/screens/onboard/controller/states.dart';
import 'controller/controller.dart';

// ignore: use_key_in_widget_constructors
class OnBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => OnBoardController(),
      child: BlocConsumer<OnBoardController, OnBoardStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final controller = OnBoardController.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                if (controller.index > 0)
                  Padding(
                    padding: EdgeInsets.only(
                        right: size.shortestSide * .04,
                        top: size.longestSide * .015),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NavigationBarScreen()),
                              (route) => false);
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                              fontSize: size.shortestSide * .04,
                              color: Colors.black),
                        )),
                  ),
              ],
            ),
            body: Container(
              margin: EdgeInsets.symmetric(
                horizontal: size.shortestSide * .05,
                vertical: size.longestSide * .02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 9,
                    child: PageView.builder(
                      itemCount: controller.imgs.length,
                      onPageChanged: (val) {
                        controller.changePage(val);
                      },
                      itemBuilder: (context, i) {
                        return Image(
                            image:
                                AssetImage(controller.imgs[i].imgs.toString()),
                            fit: BoxFit.fill);
                      },
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Dotitem(
                          length: controller.imgs.length,
                          indexChange: controller.index)),
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Text(
                      controller.imgs[controller.index].head.toString(),
                      style: TextStyle(
                          fontSize: size.shortestSide * .075,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    controller.imgs[controller.index].subtitle.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: size.shortestSide * .047),
                  ),
                  const Spacer(flex: 2),
                  ButtonItem(
                    name: controller.index > 0 ? "Next" : "Get Started",
                    onPressed: () {
                      if (controller.index < 3) {
                        controller.changePageButton(context);
                      } else {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NavigationBarScreen()),
                            (route) => false);
                      }
                    },
                  ),
                  const Spacer()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
