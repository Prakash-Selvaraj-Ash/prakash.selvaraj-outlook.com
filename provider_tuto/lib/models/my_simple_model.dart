import 'dart:async';
import 'my_model_base.dart';

class MySimpleModel extends MyModelBase {
  final StreamController<String> textStream = StreamController<String>();
  final StreamController<bool> boolStream = StreamController<bool>();

  @override
  set setMyText(String textValue) {
    super.setMyText = textValue;
    textStream.sink.add(textValue);
  }

  @override
  set setIsValid(bool value) {
    super.setIsValid = value;
    boolStream.sink.add(value);
  }

  void dispose() {
    textStream.close();
    boolStream.close();
  }
}
