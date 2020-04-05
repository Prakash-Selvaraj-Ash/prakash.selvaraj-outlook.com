import 'package:flutter/material.dart';
import 'package:provider_tuto/widgets/stateless_simple_ex.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StatelessSimpleEx(),
    );
  }
}
