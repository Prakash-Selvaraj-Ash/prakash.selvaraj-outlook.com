import 'package:flutter/material.dart';

import 'app_route_info_parser.dart';
import 'app_routrer_delegate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _parser = AppRouteInformationParser();
  final _delegate = AppRouterDelegate();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      routeInformationParser: _parser,
      routerDelegate: _delegate,
    );
  }
}
