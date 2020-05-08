import 'package:flutter/material.dart';
import 'package:http_tuto/homepage.dart';
import 'package:http_tuto/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Provider(
          child: HomePage(),
          create: (_) => PostService(),
        ));
  }
}
