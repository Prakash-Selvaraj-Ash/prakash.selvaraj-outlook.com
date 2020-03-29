import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('HomePage', style: TextStyle(fontSize: 20),),
            RaisedButton(
              child: Text('GO TO NextPage'),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/second', arguments: 'from home');
              },
            )
          ],
        ),
      ),
    );
  }
}
