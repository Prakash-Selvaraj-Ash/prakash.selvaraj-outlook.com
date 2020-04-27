import 'package:flutter/material.dart';
import 'package:named_router/named_router/home_page.dart';
import 'package:named_router/named_router/third_page.dart';
import 'package:named_router/oops.dart';
import 'package:named_router/named_router/second_page.dart';

class RouteCatalog {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/second':
        return MaterialPageRoute(builder: (_) => SecondPage(data: arguments));
      case '/third':
        return PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return ThirdPage(data1: settings.arguments);
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.9),
                  end: Offset.zero,
                ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
                child: child);
          },
        );
      default:
        return MaterialPageRoute(builder: (_) => OOPSPage());
    }
  }
}
