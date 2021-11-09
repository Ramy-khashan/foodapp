import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/component/buttonitem.dart';
import 'package:foodapp/component/dotitem.dart';
import 'package:foodapp/component/plusandminus.dart';
import 'package:foodapp/component/rating.dart';
import 'package:foodapp/screens/constcolor.dart';
import 'package:foodapp/screens/productpreview/controller/controller.dart';

import 'controller/states.dart';

class ProductPreviewScreen extends StatelessWidget {
  final String? img;
  final int? i;
  ProductPreviewScreen({Key? key, this.img = "images/food3.jpg", this.i})
      : super(key: key);

  final controller = ProductPreviewController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ProductPreviewController(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: BlocConsumer<ProductPreviewController, ProductViewState>(
          listener: (context, state) {},
          builder: (context, state) {
            final controller = ProductPreviewController.get(context);
            return Column(
              children: [
                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    itemCount: controller.imgs.length,
                    onPageChanged: (index) {
                      controller.index = index;
                    },
                    itemBuilder: (context, i) {
                      return ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          child: Image(
                              image: AssetImage(controller.imgs[i]),
                              fit: BoxFit.fill));
                    },
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: size.shortestSide * .06,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: size.longestSide * .002,
                          ),
                          Dotitem(
                            indexChange: controller.index,
                            length: controller.imgs.length,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(TextSpan(children: [
                                TextSpan(
                                  text: "Food\n",
                                  style: TextStyle(
                                      fontSize: size.shortestSide * .06,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: controller.details)
                              ])),
                              IconButton(
                                onPressed: () => controller.isCheakFavorite(),
                                icon: Icon(
                                    controller.isFavorite
                                        ? Icons.favorite_sharp
                                        : Icons.favorite_border_outlined,
                                    color: controller.isFavorite
                                        ? mainColor
                                        : null,
                                    size: size.shortestSide * .08),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PlusAndMinusItem(
                                add: () {
                                  controller.plus();
                                },
                                number: controller.num,
                                minus: () {
                                  controller.minus();
                                },
                              ),
                              Text(
                                "\$${controller.price}",
                                style: TextStyle(
                                    fontSize: size.shortestSide * .065,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Product Detail",
                                  style: TextStyle(
                                      fontSize: size.shortestSide * .045,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  onPressed: () =>
                                      controller.isExtendedDescription(),
                                  icon: Icon(
                                    controller.isExtend
                                        ? Icons.keyboard_arrow_down_sharp
                                        : Icons.keyboard_arrow_up_sharp,
                                    size: size.shortestSide * .08,
                                  ),
                                ),
                              ]),
                          Text(
                            controller.isExtend
                                ? controller.expandedDescription
                                : "",
                            style: TextStyle(
                                fontSize: size.shortestSide * .04,
                                color: Colors.grey),
                          ),
                          Row(children: [
                            Text(
                              "Nutritions",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.shortestSide * .045,
                              ),
                            ),
                            const Spacer(),
                            const Card(
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  "100gm",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              color: mainColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: size.shortestSide * .055,
                                )),
                          ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Preview",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.shortestSide * .045,
                                ),
                              ),
                              RatingItem(
                                rate: controller.rate,
                              )
                            ],
                          ),
                          SizedBox(height: size.longestSide * .01),
                          ButtonItem(
                            name: "Add to cart",
                            onPressed: () {},
                          )
                        ],
                      ),
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
