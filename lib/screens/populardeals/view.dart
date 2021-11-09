import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/component/productitem.dart';
import 'package:foodapp/screens/homepage/controller/controller.dart';
import 'package:foodapp/screens/homepage/controller/states.dart';
import 'package:foodapp/screens/productpreview/view.dart';

class PopularDealsScreen extends StatelessWidget {
  const PopularDealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomePageController(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
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
            "My Favorites",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: BlocBuilder<HomePageController, HomePageStates>(
          builder: (context, state) {
            final contoller = HomePageController.get(context);
            return GridView.count(
              childAspectRatio: 2.85 / 3,
              mainAxisSpacing: size.longestSide * .05,
              crossAxisCount: 2,
              physics: const BouncingScrollPhysics(),
              children: List.generate(
                contoller.popularFood.length,
                (i) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductPreviewScreen(
                                    i: i,
                                  )));
                    },
                    child: ProductItem(
                      img: contoller.popularFood[i],
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
