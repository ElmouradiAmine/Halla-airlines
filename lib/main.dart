import 'package:flight_search/checkout_screen.dart';
import 'package:flight_search/constants/colors.dart';
import 'package:flight_search/home_page.dart';
import 'package:flight_search/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flight Search',
      theme: new ThemeData(
      ),
      home: new SplashScreen(),
    );
  }
}