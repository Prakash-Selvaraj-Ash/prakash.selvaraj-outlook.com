import 'package:flutter/material.dart';
import 'package:navigation_2_0/user_object.dart';
import 'app_routrer_delegate.dart';

class Screen2 extends StatefulWidget {
  final String parameter;
  Screen2(this.parameter);
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  String? message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Text from Screen 1 is ${widget.parameter}'),
          TextFormField(onChanged: (text) {
            setState(() {
              message = text;
            });
          }),
          ElevatedButton(
            onPressed: message == null
                ? null
                : () => context.navigateTo(UserObject.screen3(message!)),
            child: Text('Goto Screen 3'),
          ),
          ElevatedButton(
            onPressed: () async => await context.pop(),
            child: Text('Go Back'),
          ),
        ],
      ),
    );
  }
}
