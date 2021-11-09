import 'package:flutter/material.dart';
import 'package:foodapp/component/dotitem.dart';

import 'screens/onboard/controller/controller.dart';

class Try extends StatefulWidget {
  final int? rate;

  const Try({Key? key, this.rate = 2}) : super(key: key);

  @override
  State<Try> createState() => _TryState();
}

class _TryState extends State<Try> {
  final controller = OnBoardController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          flex: 2,
          child: PageView.builder(
            itemCount: controller.imgs.length,
            onPageChanged: (index) {
              setState(() {});
              controller.index = index;
            },
            itemBuilder: (context, _) {
              return Image(
                  image: AssetImage(
                      controller.imgs[controller.index].imgs.toString()),
                  fit: BoxFit.fill);
            },
          ),
        ),
        Expanded(
            child: Dotitem(
          length: controller.imgs.length,
          indexChange: controller.index,
        )),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Text(
                controller.imgs[controller.index].head.toString(),
                style: TextStyle(
                    fontSize: size.shortestSide * .075,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                controller.imgs[controller.index].subtitle.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: size.shortestSide * .047),
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        )
      ]),
    );
  }
}
