import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String data;
  SecondPage(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I am second page :)'),
      ),
      body: Center(
        child: Text('I am second page ${this.data}'),
      ),
    );
  }
}
