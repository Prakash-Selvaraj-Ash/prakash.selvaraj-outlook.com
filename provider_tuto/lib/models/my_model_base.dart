class MyModelBase {
  String _myText = "This is a base text";

  String get myText => _myText;

  set setMyText(String textValue) {
    _myText = textValue;
  }
}
