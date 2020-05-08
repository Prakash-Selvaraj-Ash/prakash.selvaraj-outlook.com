import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_tuto/services.dart';
import 'package:provider/provider.dart';

import 'models/post.dart';

class PostEditDetail extends StatelessWidget {
  final TextEditingController titleEditingController = TextEditingController();
  final TextEditingController bodyEditingController = TextEditingController();

  final String id;
  PostEditDetail(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        color: Colors.deepOrange,
        onPressed: () {},
        icon: Icon(Icons.edit),
      ),
      body: FutureBuilder<Post>(
        future: PostService().getPostById(id),
        builder: (context, AsyncSnapshot<Post> snapShot) {
          if (snapShot.hasData) {
            var post = snapShot.data;
            titleEditingController.text = post.title;
            bodyEditingController.text = post.body;
            return Center(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: titleEditingController,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20),
                      onChanged: (val) => post.title = val,
                    ),
                    TextField(
                      maxLines: 5,
                      controller: bodyEditingController,
                      onChanged: (val) => post.body = val,
                    ),
                    RaisedButton(
                      child: Text('Post it!'),
                      onPressed: () async {
                        var editedPost = await PostService().editPost(post);
                        print(jsonEncode(editedPost.toJson()));
                        Navigator.pop(context);
                    },)
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
