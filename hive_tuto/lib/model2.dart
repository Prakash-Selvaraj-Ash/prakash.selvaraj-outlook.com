import 'package:hive/hive.dart';
import 'package:hive_tuto/base_model.dart';

@HiveType()
class Model2 extends BaseModel {
  @HiveField(1)
  final String fullName;

  @HiveField(2)
  final String chummaStr;

  const Model2(type, this.fullName, this.chummaStr) : super(type);
}
