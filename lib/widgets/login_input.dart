import 'package:flight_search/constants/colors.dart';
import 'package:flight_search/home_page.dart';
import 'package:flight_search/widgets/raised_gradient_button.dart';
import 'package:flutter/material.dart';

class LoginInput extends StatefulWidget {
  @override
  LoginInputState createState() {
    return new LoginInputState();
  }
}

class LoginInputState extends State<LoginInput> with TickerProviderStateMixin {

  bool isVisible = false;

  void toggleVisibility(){
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 16.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: Icon(Icons.email, color: lightBlueColor),
                  labelText: "Email",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 16.0),
              child: TextFormField(
                obscureText: !isVisible,

                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: toggleVisibility,
                    icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),),

                  icon: Icon(Icons.lock, color: lightBlueColor),
                  labelText: "Password",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32.0, 32.0, 16.0, 16.0),
              child: RaisedGradientButton(
                gradient: new LinearGradient(
                  stops: [
                    0.001,
                    1
                  ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue[700], lightBlueColor],
              ),
                onPressed: () {
                  pushToHomePage();
                },
                child: Center(
                  child:Text('Login', style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 21.0,

                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  pushToHomePage(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => HomePage()
    ));
  }


}
