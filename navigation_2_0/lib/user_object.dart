import 'package:navigation_2_0/Screen1.dart';

import 'Screen2.dart';
import 'Screen3.dart';

class UserObject {
  final Type? pageType;
  final String? param;
  final bool isUnknown;

  UserObject.screen1()
      : pageType = Screen1,
        param = null,
        isUnknown = false;

  UserObject.screen2(String parameter)
      : pageType = Screen2,
        param = parameter,
        isUnknown = false;

  UserObject.screen3(String parameter)
      : pageType = Screen3,
        param = parameter,
        isUnknown = false;

  UserObject.unKnown()
      : pageType = null,
        param = null,
        isUnknown = true;
}
