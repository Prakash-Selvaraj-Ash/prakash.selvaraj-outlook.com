import 'package:flutter/material.dart';

class StateFullEx extends StatefulWidget {
  @override
  _StateFullExState createState() => _StateFullExState();
}

class _StateFullExState extends State<StateFullEx> {
  String textValue;

  @override
  void initState() {
    super.initState();
    textValue = "This is simple text";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I am StateFull Widget'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(textValue, style: TextStyle(fontSize: 20)),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Enter text',
                    hintStyle: TextStyle(fontStyle: FontStyle.italic)),
                onChanged: (String text) {
                  setState(() {
                    textValue = text;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
