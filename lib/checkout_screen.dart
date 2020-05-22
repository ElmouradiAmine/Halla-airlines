import 'package:flutter/material.dart';


import 'package:flight_search/air_asia_bar.dart';

import 'checkout_card.dart';




class CheckoutScreen extends StatelessWidget {
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
              child: CheckoutCard(),
            ),
          ),


        ],
      ),
    );
  }
}
