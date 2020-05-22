import 'package:flight_search/constants/colors.dart';
import 'package:flight_search/widgets/raised_gradient_button.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';

class SignUpInput extends StatefulWidget {
  @override
  SignUpInputState createState() {
    return new SignUpInputState();
  }
}

class SignUpInputState extends State<SignUpInput> with TickerProviderStateMixin {

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
                decoration: InputDecoration(
                  icon: Icon(Icons.person, color: lightBlueColor),
                  labelText: "Full Name",
                ),
              ),
            ),
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
                    icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility)),
                  icon: Icon(Icons.lock, color: lightBlueColor),
                  labelText: "Password",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  Text('By clicking Sign up you agree to our ',softWrap: true,),
                  Text('User Agreement ',softWrap: true,style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('and ',softWrap: true),
                  Text('Privacy Policy.',softWrap: true, style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
            ),
            Padding(

              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
              child: RaisedGradientButton(
                gradient: new LinearGradient(
 
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue[700], lightBlueColor],
                ),
                onPressed: () {
                  pushToHomePage();
                },
                child: Center(
                  child:Text('Sign up', style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,

                  ),),
                ),
              ),
            ),
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
