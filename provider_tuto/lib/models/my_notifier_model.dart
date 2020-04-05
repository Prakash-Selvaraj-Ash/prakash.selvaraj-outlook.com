import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:provider_tuto/models/my_model_base.dart';

class MyNotifierModel extends MyModelBase with ChangeNotifier {

  @override
  set setMyText(String textValue) {
    super.setMyText = textValue;
    notifyListeners();
  }
}
