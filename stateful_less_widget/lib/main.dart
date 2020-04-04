import 'package:flutter/material.dart';
import 'package:stateful_less_widget/widgets/statefull_ex.dart';
import 'package:stateful_less_widget/widgets/stateless_ex.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StatelessEx(),
    );
  }
}
