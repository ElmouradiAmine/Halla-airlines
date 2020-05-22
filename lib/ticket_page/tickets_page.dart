import 'package:flight_search/air_asia_bar.dart';
import 'package:flight_search/checkout_screen.dart';
import 'package:flight_search/ticket_page/flight_stop_ticket.dart';
import 'package:flight_search/ticket_page/ticket_card.dart';
import 'package:flutter/material.dart';

class TicketsPage extends StatefulWidget {
  @override
  _TicketsPageState createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage>
    with TickerProviderStateMixin {
  List<FlightStopTicket> stops = [
    new FlightStopTicket("10:00 am", "MGQ", "12:00 am", "BSA", "HA102", "Saturday"),
    new FlightStopTicket("12:30 pm", "BSA", "13:30 pm", "GGR", "HA103", "Saturday"),
    new FlightStopTicket("14:00 pm", "GGR", "15:30 pm", "MGQ", "HA103", "Saturday"),
    new FlightStopTicket("16:00 pm", "MGQ", "17:00 pm", "KMU", "HA105", "Saturday"),
    new FlightStopTicket("08:00 am", "KMU", "08:45 am", "MGQ", "HA106", "Sunday"),
    new FlightStopTicket("16:00 pm", "MGQ", "17:00 pm", "KMU", "HA105", "Monday"),
    new FlightStopTicket("08:00 pm", "KMU", "08:45 pm", "MGQ", "HA106", "Tuesday"),
    new FlightStopTicket("10:00 am", "MGQ", "12:00 pm", "BSA", "HA132", "Tuesday"),
    new FlightStopTicket("12:30 pm", "BSA", "13:30 pm", "GGR", "HA133", "Tuesday"),
    new FlightStopTicket("14:00 pm", "GGR", "15:30 pm", "MGQ", "HA133", "Tuesday"),
    new FlightStopTicket("10:00 am", "MGQ", "11:30 am", "GGR", "HA132","Thursday"),
    new FlightStopTicket("12:30 pm", "GGR", "14:00 pm", "MGQ", "HA133","Thursday"),





  ];
  AnimationController cardEntranceAnimationController;
  List<Animation> ticketAnimations;
  Animation fabAnimation;

  @override
  void initState() {
    super.initState();
    cardEntranceAnimationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1100),
    );
    ticketAnimations = stops.map((stop) {
      int index = stops.indexOf(stop);
      double start = index * 0.1;
      double duration = 0.6;
      double end = duration + start;
      return new Tween<double>(begin: 800.0, end: 0.0).animate(
          new CurvedAnimation(
              parent: cardEntranceAnimationController,
              curve: new Interval(start <= 1.0 ? start :1, end <= 1 ? end : 1, curve: Curves.decelerate)));
    }).toList();
    fabAnimation = new CurvedAnimation(
        parent: cardEntranceAnimationController,
        curve: Interval(0.7, 1.0, curve: Curves.decelerate));
    cardEntranceAnimationController.forward();
  }

  @override
  void dispose() {
    cardEntranceAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          AirAsiaBar(
            height: 180.0,
          ),
          Positioned.fill(
            top: MediaQuery.of(context).padding.top + 64.0,
            child: SingleChildScrollView(
              child: new Column(
                children: _buildTickets().toList()..add(SizedBox(
                  height: 80.0,
                )),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: _buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Iterable<Widget> _buildTickets() {
    return stops.map((stop) {
      int index = stops.indexOf(stop);
      return AnimatedBuilder(
        animation: cardEntranceAnimationController,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: TicketCard(stop: stop),
        ),
        builder: (context, child) => new Transform.translate(
              offset: Offset(0.0, ticketAnimations[index].value),
              child: child,
            ),
      );
    });
  }

  _buildFab() {
    return ScaleTransition(
      scale: fabAnimation,
      child: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CheckoutScreen())
        ),
        child: new Icon(Icons.fingerprint),
      ),
    );
  }
}
