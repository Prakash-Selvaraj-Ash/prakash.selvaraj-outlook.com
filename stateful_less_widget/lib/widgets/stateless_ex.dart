import 'package:flutter/material.dart';

class StatelessEx extends StatelessWidget {
  String textValue = "This is simple text";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I am a state less widget'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(textValue),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Enter text',
                    hintStyle: TextStyle(fontStyle: FontStyle.italic)),
                onChanged: (String text) {
                  textValue = text;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
