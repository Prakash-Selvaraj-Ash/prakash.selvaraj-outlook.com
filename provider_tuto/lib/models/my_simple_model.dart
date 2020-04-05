import 'dart:async';
import 'my_model_base.dart';

class MySimpleModel extends MyModelBase {
  final StreamController<String> textStream = StreamController<String>();

  @override
  set setMyText(String textValue) {
    super.setMyText = textValue;
    textStream.sink.add(textValue);
  }

  void dispose() {
    textStream.close();
  }
}
