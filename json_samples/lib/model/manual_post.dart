class ManualPost {
  int userId;
  int id;
  String title;
  String body;

  ManualPost({this.userId, this.id, this.title, this.body});

  Map<String, dynamic> toJson() =>
      {'userId': userId, 'id': id, 'title': title, 'body': body};

  ManualPost.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        title = json['title'],
        body = json['body'];
}
