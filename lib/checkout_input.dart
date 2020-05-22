import 'package:flight_search/constants/colors.dart';
import 'package:flight_search/home_page.dart';
import 'package:flight_search/widgets/raised_gradient_button.dart';
import 'package:flutter/material.dart';


class CheckoutInput extends StatefulWidget {
  @override
  CheckoutInputState createState() {
    return new CheckoutInputState();
  }
}

class CheckoutInputState extends State<CheckoutInput> with TickerProviderStateMixin {

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  width: 100,
                      child: Image.asset('images/visa.png')),
                SizedBox(
                    width: 100,
                    child: Image.asset('images/mastercard.png')),
                SizedBox(
                    width: 100,
                    child: Image.asset('images/paypal.png')),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person, color: lightBlueColor),
                  labelText: "Cardholder Name",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 16.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: Icon(Icons.credit_card, color: lightBlueColor),
                  labelText: "CardNumber",
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.date_range, color: lightBlueColor),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: TextFormField(
                      style: TextStyle(
                          fontSize: 14
                      ),
                      decoration: InputDecoration(
                        hintText: 'mm/yyyy',

                          labelText: "End Date"),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TextFormField(
                      style: TextStyle(
                          fontSize: 14
                      ),
                      decoration: InputDecoration(
                        hintText: '3 digits',

                          labelText: "CVV"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0,8.0),

            child: Row(
              children: <Widget>[
                Text('Total :', style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0,
                ),),
                Text(' 200 \$', style: TextStyle(
                  color: Colors.black,
                  fontSize: 21.0,
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
                  child:Text('Pay Now', style: TextStyle(
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
