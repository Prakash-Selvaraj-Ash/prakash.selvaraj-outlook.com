import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String data;
  SecondPage({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[Text('Second Page'), Text(this.data)],
          ),
        ),
      ),
    );
  }
}
