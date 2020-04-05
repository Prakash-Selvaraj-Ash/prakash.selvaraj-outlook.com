class MyModelBase {
  String _myText = "This is a base text";
  bool _isValid = false;

  String get myText => _myText;

  set setMyText(String textValue) {
    _myText = textValue;
  }


  bool get isValid => _isValid;

  set setIsValid(bool value){
    _isValid = value;
  }
}
