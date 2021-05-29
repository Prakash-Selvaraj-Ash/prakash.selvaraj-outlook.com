import 'package:flutter/material.dart';
import 'package:navigation_2_0/user_object.dart';
import 'app_routrer_delegate.dart';

class Screen3 extends StatefulWidget {
  final String parameter;
  Screen3(this.parameter);
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  late String message;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text('Text from Screen 2 is ${widget.parameter}'),
            ElevatedButton(
              onPressed: () => context.popUntil(UserObject.screen1()),
              child: Text('Goto Home'),
            ),
            ElevatedButton(
              onPressed: () async => await context.pop(),
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
