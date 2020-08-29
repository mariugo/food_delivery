import 'package:flutter/material.dart';
import 'package:fooddelivery/screens/home.dart';
import 'package:fooddelivery/screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Food Delivery',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        //CREATE A SPLASH SCREEN AS HOME
        home: Splash());
  }
}
