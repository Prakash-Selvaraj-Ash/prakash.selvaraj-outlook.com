import 'package:hive/hive.dart';
import 'package:hive_tuto/model1.dart';

class Model1Adapter extends TypeAdapter<Model1> {
  @override
  Model1 read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return Model1(fields[0] as String, fields[1] as String, fields[2] as int);
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Model1 obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.chummaInt);
  }
}
