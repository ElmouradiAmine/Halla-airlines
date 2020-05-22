import 'package:flight_search/multicity_input.dart';
import 'package:flight_search/price_tab/price_tab.dart';
import 'package:flight_search/widgets/login_input.dart';
import 'package:flight_search/widgets/signup_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class AuthenticationCard extends StatefulWidget {
  @override
  _AuthenticationCardState createState() => _AuthenticationCardState();
}

class _AuthenticationCardState extends State<AuthenticationCard> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: DefaultTabController(
        child: new LayoutBuilder(
          builder:
              (BuildContext context, BoxConstraints viewportConstraints) {
            return Column(
              children: <Widget>[
                _buildTabBar(),
                _buildContentContainer(viewportConstraints),
              ],
            );
          },
        ),
        length: 2,
      ),

    );
  }

  Widget _buildTabBar({bool showFirstOption}) {
    return Stack(
      children: <Widget>[
        new Positioned.fill(
          top: null,
          child: new Container(
            height: 2.0,
            color: new Color(0xFFEEEEEE),
          ),
        ),
        new TabBar(
          onTap: (index){
            print(index);
            if (page!=index)
              setState(() {
                page = index;
              });
          },
          labelStyle: TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.bold,
          ),

          tabs: [
            Tab(text: 'Login', ),
            Tab(text: 'Sign Up'),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildContentContainer(BoxConstraints viewportConstraints) {
    return Expanded(
      child: SingleChildScrollView(
        child: new ConstrainedBox(
            constraints: new BoxConstraints(
              minHeight: viewportConstraints.maxHeight - 48.0,
            ),
            child: page == 0 ? LoginInput() : SignUpInput()

        ),
      ),
    );
  }


}


