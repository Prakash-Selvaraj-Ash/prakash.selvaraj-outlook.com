import 'package:flutter/material.dart';
import 'package:named_router/simple_router/second_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('I am home page :)'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('Go to Second'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondPage('from first page')));
            },
          ),
        ));
  }
}
