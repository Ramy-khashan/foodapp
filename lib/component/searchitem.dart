import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final TextEditingController? controller;
  final Function()? filterMethod;
  const SearchItem({Key? key, this.controller, this.filterMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          left: size.shortestSide * .05, right: size.shortestSide * .04),
      height: size.longestSide * .08,
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: size.shortestSide * .07,
                ),
                hintText: "Search for Anything",
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: filterMethod,
              icon: Icon(Icons.filter_list, size: size.shortestSide * .08))
        ],
      ),
    );
  }
}
