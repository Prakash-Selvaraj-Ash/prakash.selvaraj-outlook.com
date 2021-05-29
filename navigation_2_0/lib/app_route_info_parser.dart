import 'package:flutter/material.dart';
import 'package:navigation_2_0/Screen1.dart';
import 'package:navigation_2_0/Screen3.dart';
import 'package:navigation_2_0/user_object.dart';

import 'Screen2.dart';

class AppRouteInformationParser extends RouteInformationParser<UserObject> {
  @override
  Future<UserObject> parseRouteInformation(
      RouteInformation routeInformation) async {
    if (routeInformation.location == null) {
      UserObject.unKnown();
    }
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.length == 2) {
      final remaining = uri.pathSegments.last;
      final first = uri.pathSegments.first;
      if ('$first' == 'screen2') {
        return UserObject.screen2(remaining);
      }
      if ('/$first' == 'screen3') {
        return UserObject.screen3(remaining);
      }

      return UserObject.unKnown();
    }

    return UserObject.screen1();
  }

  @override
  RouteInformation? restoreRouteInformation(UserObject configuration) {
    RouteInformation error = RouteInformation(location: '/404');
    if (configuration.pageType == null) {
      return error;
    }
    switch (configuration.pageType!) {
      case Screen1:
        return RouteInformation(location: '/');
      case Screen2:
        return RouteInformation(location: '/screen2/${configuration.param}');
      case Screen3:
        return RouteInformation(location: '/screen3/${configuration.param}');
      default:
        return error;
    }
  }
}
