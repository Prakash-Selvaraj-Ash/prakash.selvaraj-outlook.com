import 'package:hive/hive.dart';

class BaseModel {
  @HiveField(0)
  final String type;
  const BaseModel(this.type);
}
