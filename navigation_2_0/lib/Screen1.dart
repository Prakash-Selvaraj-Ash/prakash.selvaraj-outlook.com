import 'package:flutter/material.dart';
import 'app_routrer_delegate.dart';
import 'package:navigation_2_0/user_object.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  String? message;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextFormField(onChanged: (text) {
              setState(() {
                message = text;
              });
            }),
            ElevatedButton(
              onPressed: message == null
                  ? null
                  : () => context.navigateTo(UserObject.screen2(message!)),
              child: Text('Goto Screen 2'),
            )
          ],
        ),
      ),
    );
  }
}
