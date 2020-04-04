
import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(App());

class App extends StatelessWidget {
  App();

  @override
  Widget build(BuildContext context) {
    final controller = StreamController<String>();

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Text Change'),
          ),
          body: Column(
            children: <Widget>[
              TextField(
                onChanged: (String text) => controller.sink.add(text),
              ),
              StreamBuilder<String>(
                  stream: controller.stream,
                  builder: (context, snapshot) {
                    return RaisedButton(
                      child: Text('Press'),
                      onPressed:
                          snapshot.data != null && snapshot.data.length > 2
                              ? () {
                                  AlertDialog(
                                    content: Text('I am pressed'),
                                  );
                                }
                              : null,
                    );
                  })
            ],
          )),
    );
  }
}
