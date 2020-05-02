import 'package:json_annotation/json_annotation.dart';
part 'auto_gen_post.g.dart';

@JsonSerializable()
class AutoGenPost {
  @JsonKey(name: 'userId')
  int userId;
  @JsonKey(name: 'id')
  int postId;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'body')
  String body;

  AutoGenPost();

  factory AutoGenPost.fromJson(Map<String, dynamic> json) => _$AutoGenPostFromJson(json);

  Map<String, dynamic> toJson() => _$AutoGenPostToJson(this);
}
