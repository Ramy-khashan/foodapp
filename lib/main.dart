import 'package:flutter/material.dart';
import 'package:foodapp/screens/navigationbar/view.dart';
import 'package:foodapp/screens/onboard/view.dart';
import 'package:foodapp/screens/recipes/recipes.dart';
import 'package:foodapp/screens/splash/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
