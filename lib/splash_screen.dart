import 'package:flight_search/checkout_screen.dart';
import 'package:flight_search/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'Authentication_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final spinkit = SpinKitFadingCircle(
    color: lightBlueColor,
    size: 50.0,
  );
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5)).then(
      (value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => AuthenticationScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width / 3,
            child: Image.asset('images/logo.png'),
          ),
          SizedBox(
            height: 20,
          ),
          spinkit,
        ],
      ),
    );
  }
}
