import 'package:flutter/material.dart';

class FadeRoute<T> extends MaterialPageRoute<T> {
  FadeRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 100);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    
    return new FadeTransition(opacity: animation, child: child);
  }
}
