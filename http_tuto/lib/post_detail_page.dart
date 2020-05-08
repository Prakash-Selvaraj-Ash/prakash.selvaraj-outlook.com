import 'package:flutter/material.dart';
import 'package:http_tuto/post_edit_page.dart';
import 'package:http_tuto/services.dart';
import 'package:provider/provider.dart';

class PostDetail extends StatelessWidget {
  final String id;
  PostDetail(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        color: Colors.deepOrange,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PostEditDetail(id)));
        },
        icon: Icon(Icons.edit),
      ),
      body: FutureBuilder(
        future: PostService().getPostById(id),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            var post = snapShot.data;
            return Center(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      post.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(post.body)
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
