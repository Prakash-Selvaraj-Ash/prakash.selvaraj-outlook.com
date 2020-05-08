import 'dart:convert';
import 'package:http/http.dart';
import 'models/post.dart';

class PostService {
  Future<List<Post>> getPosts() async {
    Client client = Client();
    try {
      var response =
          await client.get('https://jsonplaceholder.typicode.com/posts');
      List posts = jsonDecode(response.body);
      return posts.map((post) => Post.fromJson(post)).toList();
    } finally {
      client.close();
    }
  }

  Future<Post> getPostById(String id) async {
    Client client = Client();
    try {
      var response =
          await client.get('https://jsonplaceholder.typicode.com/posts/${id}');
      var post = jsonDecode(response.body);
      return Post.fromJson(post);
    } finally {
      client.close();
    }
  }

  Future<Post> editPost(Post editedPost) async {
    Client client = Client();
    try {
      String url =
          'https://jsonplaceholder.typicode.com/posts/${editedPost.id}';
      var body = jsonEncode(editedPost.toJson());
      var response = await client.put(
        url,
        body: body,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      var post = jsonDecode(response.body);
      return Post.fromJson(post);
    } finally {
      client.close();
    }
  }

  Future deletePost(int id) async {
    Client client = Client();
    try {
      String url = 'https://jsonplaceholder.typicode.com/posts/${id}';
      await client.delete(url);
      print('post deleted succesfully');
    } finally {
      client.close();
    }
  }

  Future<Post> newPost(Post editedPost) async {
    Client client = Client();
    try {
      String url = 'https://jsonplaceholder.typicode.com/posts/';
      var body = jsonEncode(editedPost.toJson());
      var response = await client.post(
        url,
        body: body,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      var post = jsonDecode(response.body);
      return Post.fromJson(post);
    } finally {
      client.close();
    }
  }
}
