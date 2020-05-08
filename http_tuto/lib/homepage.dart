import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_tuto/post_detail_page.dart';
import 'package:http_tuto/services.dart';
import 'package:provider/provider.dart';

import 'models/post.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = List<Post>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed: () async {
          var response = await PostService().newPost(Post(
              body: 'new body', title: 'new title', id: 1000, userId: 1000));
          print(jsonEncode(response.toJson()));
        },
      ),
      body: FutureBuilder<List<Post>>(
        future: Provider.of<PostService>(context).getPosts(),
        builder: (context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var post = snapshot.data[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Dismissible(
                      key: ValueKey(post.id),
                      onDismissed: (direction) async {
                        snapshot.data.remove(post);
                        await PostService().deletePost(post.id);
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PostDetail(post.id.toString())));
                        },
                        child: Card(
                          elevation: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                post.title,
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(post.body.substring(0, 50))
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
