import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: <Widget>[
          Text('HomePage'),
          RaisedButton(
            child: Text('GO TO NextPage'),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/second', arguments: 'from home');
            },
          )
        ],
      ),
    );
  }
}
