import 'package:flight_search/constants/colors.dart';
import 'package:flight_search/typable_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MulticityInput extends StatefulWidget {
  @override
  MulticityInputState createState() {
    return new MulticityInputState();
  }
}

class MulticityInputState extends State<MulticityInput>
    with TickerProviderStateMixin {
  AnimationController textInputAnimationController;

  DateTime _departureDateTime;
  DateTime _arrivalDateTime;
  TextEditingController _departureTimeController = TextEditingController();
  TextEditingController _arrivalTimeController  = TextEditingController();

  @override
  void initState() {
    super.initState();
    textInputAnimationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 800));
  }

  @override
  void dispose() {
    textInputAnimationController.dispose();


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TypeableTextFormField(
                finalText: "Kochfurt",
                animation: _buildInputAnimation(begin: 0.0,end: 0.2),
                decoration: InputDecoration(
                  icon: Icon(Icons.flight_takeoff, color: lightBlueColor),
                  labelText: "From",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TypeableTextFormField(
                animation: _buildInputAnimation(begin: 0.15,end: 0.35),
                finalText: "Lake Xanderland",
                decoration: InputDecoration(
                  icon: Icon(Icons.flight_land, color: lightBlueColor),
                  labelText: "To",
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TypeableTextFormField(
                animation: _buildInputAnimation(begin: 0.45,end: 0.65),
                finalText: "4",
                decoration: InputDecoration(
                  icon: Icon(Icons.person, color: lightBlueColor),
                  labelText: "Passengers",
                ),
              ),
            ),
            SizedBox(
              height: 36.0,
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
                      readOnly: true,
                      style: TextStyle(
                        fontSize: 14
                      ),
                      controller: _departureTimeController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: (){
                              showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2100)).then(
                                  (date){
                                    setState(() {
                                      _departureDateTime = date;
                                      _departureTimeController.text = DateFormat('MMMMEEEEd').format(_departureDateTime);

                                    });
                                  }
                              );
                            },
                            icon: Icon(Icons.date_range),),
                          labelText: "Departure"),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TextFormField(
                     readOnly: true,
                      style: TextStyle(
                          fontSize: 14
                      ),
                      controller: _arrivalTimeController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: (){
                              showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2019), lastDate: DateTime(2100)).then(
                                      (date){
                                    setState(() {
                                      _arrivalDateTime = date;
                                      _arrivalTimeController.text = DateFormat('MMMMEEEEd').format(_arrivalDateTime);
                                    });
                                  }
                              );
                            },
                            icon: Icon(Icons.date_range),),
                          labelText: "Arrival"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  CurvedAnimation _buildInputAnimation({double begin, double end}) {
    return new CurvedAnimation(
        parent: textInputAnimationController,
        curve: Interval(begin, end, curve: Curves.linear)
    );
  }

}
