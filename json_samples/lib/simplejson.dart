import 'dart:convert';

import 'package:flutter/material.dart';

import 'model/manual_post.dart';



class SimpleJson extends StatefulWidget {
  @override
  _SimpleJsonState createState() => _SimpleJsonState();
}

class _SimpleJsonState extends State<SimpleJson> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Simple Json Using manual Map'),
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text('Conver to Json'),
                    onPressed: () {
                      var post = ManualPost();
                      post.id = 1;
                      post.userId = 1;
                      post.title = "Title";
                      post.body = "Body";
                      String jsonString = jsonEncode(post);
                      print(jsonString);

                      Map map = jsonDecode(jsonString);
                      print(ManualPost.fromJson(map));
                    },
                  )
                ],
              ),
            )));
  }
}
