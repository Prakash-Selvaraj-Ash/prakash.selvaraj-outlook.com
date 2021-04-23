import 'dart:convert';
import 'package:http/http.dart';
import 'package:http_tuto/web_request_builder.dart';
import 'models/post.dart';

class PostService {
  Future<List<Post>> getPosts() async {
    Client client = Client();
    try {
      var response = await WebRequestBuilder()
          .create(HttpMethod.Get, 'https://jsonplaceholder.cypress.io/posts')
          .executeRequestAsync<List<Post>, Post>();

      return response;
    } catch (ex) {
      print(ex);
      return null;
    } finally {
      client.close();
    }
  }

  Future<Post> getPostById(String id) async {
    var response = await WebRequestBuilder()
        .create(HttpMethod.Get, 'https://jsonplaceholder.cypress.io/posts/{id}')
        .withParameters('id', id)
        .executeRequestAsync<Post, Null>();

    return response;
  }

  Future<Post> editPost(Post editedPost) async {
    String body = jsonEncode(editedPost.toJson());

    var response = await WebRequestBuilder()
        .create(HttpMethod.Put, 'https://jsonplaceholder.cypress.io/posts/{id}')
        .withParameters('id', editedPost.id.toString())
        .withBodyString(body)
        .executeRequestAsync<Post, Null>();

    return response;
  }

  Future deletePost(int id) async {
    await WebRequestBuilder()
        .create(
            HttpMethod.Delete, 'https://jsonplaceholder.cypress.io/posts/{id}')
        .withParameters('id', id.toString())
        .executeVoidRequestAsync();

    print('post deleted succesfully');
  }

  Future<Post> newPost(Post editedPost) async {
    String url = 'https://jsonplaceholder.cypress.io/posts/';
    var body = jsonEncode(editedPost.toJson());
    var response = await WebRequestBuilder()
        .create(HttpMethod.Post, url)
        .withBodyString(body)
        .executeRequestAsync<Post, Null>();
    return response;
  }
}
