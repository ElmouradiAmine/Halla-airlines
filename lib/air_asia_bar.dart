import 'package:flight_search/constants/colors.dart';
import 'package:flutter/material.dart';

class AirAsiaBar extends StatelessWidget {
  final double height;

  const AirAsiaBar({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [darkBlueColor, lightBlueColor],
            ),
          ),
          height: height,
        ),
        new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: new Text(
            "Halla Airlines",
            style: TextStyle(
              fontSize: 21.0,
                fontFamily: 'NothingYouCouldDo', fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
