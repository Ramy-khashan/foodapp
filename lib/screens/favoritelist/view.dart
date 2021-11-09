import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/component/favoriteitem.dart';
import 'package:foodapp/screens/favoritelist/controller/controller.dart';
import 'package:foodapp/screens/favoritelist/controller/states.dart';

class FavoriteListScreen extends StatelessWidget {
  const FavoriteListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => FavoriteListController(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            "My Favorites",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: BlocConsumer<FavoriteListController, FavoritStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final controller = FavoriteListController.get(context);
            return SizedBox(
              height: size.longestSide,
              child: ListView.builder(
                itemBuilder: (context, i) {
                  return FavoriteItem(
                    img: controller.favorite[i].img,
                    name: controller.favorite[i].name,
                    price: controller.favorite[i].price,
                    type: controller.favorite[i].type,
                    add: () => controller.add(i),
                    minus: () => controller.minus(i),
                    number: controller.favorite[i].number,
                  );
                },
                itemCount: controller.favorite.length,
                physics: const BouncingScrollPhysics(),
              ),
            );
          },
        ),
      ),
    );
  }
}
