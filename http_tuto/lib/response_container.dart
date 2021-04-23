import 'models/post.dart';

class ResponseContainer {
  static T fromJson<T, K>(dynamic json) {
    if (json is Iterable) {
      return _fromJsonList<K>(json) as T;
    }
    switch (T) {
      case Post:
        Post res = Post.fromJson(json);
        return res as T;
      case bool:
      case String:
      case int:
      case double:
      case Map:
        return json;
      default:
        throw new Exception('Invalid type ${T.toString()}');
    }
  }

  static List<K> _fromJsonList<K>(List<dynamic> jsonList) {
    return jsonList
        ?.map<K>((dynamic json) => fromJson<K, void>(json))
        ?.toList();
  }
}
