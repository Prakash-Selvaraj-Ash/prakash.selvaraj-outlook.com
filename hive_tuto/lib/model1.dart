import 'package:hive/hive.dart';

import 'base_model.dart';

@HiveType()
class Model1 extends BaseModel {
  // @HiveField(0)
  // final String type;

  @HiveField(1)
  final String fullName;

  @HiveField(2)
  final int chummaInt;

  const Model1(type, this.fullName, this.chummaInt) : super(type);
}
