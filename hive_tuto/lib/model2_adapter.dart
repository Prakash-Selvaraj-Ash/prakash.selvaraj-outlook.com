import 'package:hive/hive.dart';
import 'package:hive_tuto/model2.dart';

class Model2Adapter extends TypeAdapter<Model2> {
  @override
  Model2 read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return Model2(
        fields[0] as String, fields[1] as String, fields[2] as String);
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, Model2 obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.chummaStr);
  }
}
