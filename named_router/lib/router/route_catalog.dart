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
        return MaterialPageRoute(builder: (_) => ThirdPage(data1: arguments));
      default:
        return MaterialPageRoute(builder: (_) => OOPSPage());
    }
  }
}
