import 'package:flutter/material.dart';

class RouteAnimation extends PageRouteBuilder {
  final Widget widget;

  RouteAnimation({this.widget})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionsBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation, Widget child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            transitionDuration: Duration(milliseconds: 300));
}
