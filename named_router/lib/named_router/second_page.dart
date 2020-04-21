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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Second Page',
                style: TextStyle(fontSize: 30),
              ),
              Text(this.data),
              RaisedButton(
                child: Text('Move to third'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/third',
                      arguments: <String, String>{
                        'Data1': 'Data1',
                        'Data2': 'Data2'
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
