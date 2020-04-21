import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  final Map<String, String> data1;
  ThirdPage({@required this.data1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Third Page',
                style: TextStyle(fontSize: 30),
              ),
              Text(this.data1.values.join())
            ],
          ),
        ),
      ),
    );
  }
}
