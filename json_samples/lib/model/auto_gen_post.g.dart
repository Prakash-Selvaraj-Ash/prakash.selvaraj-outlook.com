// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_gen_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutoGenPost _$AutoGenPostFromJson(Map<String, dynamic> json) {
  return AutoGenPost()
    ..userId = json['userId'] as int
    ..postId = json['id'] as int
    ..title = json['title'] as String
    ..body = json['body'] as String;
}

Map<String, dynamic> _$AutoGenPostToJson(AutoGenPost instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.postId,
      'title': instance.title,
      'body': instance.body,
    };
