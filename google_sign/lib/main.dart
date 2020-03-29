import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool _isSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('G-Login'), actions: <Widget>[
          FutureBuilder(
            future: googleSignIn.isSignedIn(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data) {
                  return IconButton(
                      icon: Icon(Icons.block),
                      onPressed: () async {
                        try {
                          await googleSignIn.signOut();
                          setState(() {
                            _isSignedIn = false;
                          });
                        } catch (error) {}
                      });
                } else {
                  return IconButton(
                      icon: Icon(Icons.account_circle),
                      onPressed: () async {
                        await googleSignIn.signIn();
                        setState(() {
                          _isSignedIn = true;
                        });
                      });
                }
              } else {
                return CircularProgressIndicator();
              }
            },
          )
        ]),
      ),
    );
  }
}
