import 'package:flight_search/air_asia_bar.dart';
import 'package:flight_search/widgets/authentication_card.dart';
import 'package:flutter/material.dart';




class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AirAsiaBar(height: 210.0),

          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 100.0),
              child: AuthenticationCard(),
            ),
          ),


        ],
      ),
    );
  }
}
