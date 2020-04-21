import 'package:flutter/material.dart';
import 'package:named_router/router/route_catalog.dart';
import 'package:named_router/simple_router/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      initialRoute: '/',
      onGenerateRoute: RouteCatalog.generateRoute,
    );
  }
}
