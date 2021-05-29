import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation_2_0/Screen1.dart';
import 'package:navigation_2_0/Screen2.dart';
import 'package:navigation_2_0/Screen3.dart';
import 'package:navigation_2_0/user_object.dart';

extension RouteExtension on BuildContext {
  Future<void> navigateTo(UserObject path) async {
    (Router.of(this).routerDelegate as AppRouterDelegate).push(path);
  }

  Future<bool> pop() async {
    return await (Router.of(this).routerDelegate as AppRouterDelegate)
        .popRoute();
  }

  Future<bool> popUntil(UserObject path) async {
    AppRouterDelegate deletgate =
        (Router.of(this).routerDelegate as AppRouterDelegate);
    while (deletgate.userObjects.last.pageType != path.pageType!) {
      await this.pop();
    }

    return true;
  }
}

class AppRouterDelegate extends RouterDelegate<UserObject>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<UserObject> {
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  List<UserObject> _userObjects = [];
  List<UserObject> get userObjects => _userObjects;

  bool _canPop = true;

  GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  bool get canPop {
    if (_canPop == false) return false;

    return _userObjects.isNotEmpty;
  }

  set canPop(bool canPop) => _canPop = canPop;

  UserObject? get currentConfiguration =>
      userObjects.isNotEmpty ? userObjects.last : null;

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: _navigatorKey,
        pages: [
          if (userObjects.isEmpty) PageBuilder(UserObject.screen1()).page,
          for (UserObject path in userObjects) PageBuilder(path).page,
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          if (canPop) {
            pop();
          }
          return true;
        });
  }

  @override
  Future<void> setNewRoutePath(UserObject path) async {
    if (_canPop == false) return SynchronousFuture(null);
    if (path == currentConfiguration) return SynchronousFuture(null);
    _userObjects = _setNewRouteHistory(_userObjects, path);

    notifyListeners();
    return SynchronousFuture(null);
  }

  @override
  Future<bool> popRoute() {
    print('Pop Route');
    return super.popRoute();
  }

  List<UserObject> _setNewRouteHistory(
      List<UserObject> routes, UserObject newRoute) {
    List<UserObject> pathsHolder = [];
    pathsHolder.addAll(routes);
    // Check if new path exists in history.
    for (UserObject path in routes) {
      // If path exists, remove all paths on top.
      if (path.pageType == newRoute.pageType) {
        int index = routes.indexOf(path);
        int count = routes.length;
        for (var i = index; i < count - 1; i++) {
          pathsHolder.removeLast();
        }
        return pathsHolder;
      }
    }

    pathsHolder.add(newRoute);

    return pathsHolder;
  }

  void push(UserObject path) {
    _userObjects.add(path);
    notifyListeners();
  }

  void pop() {
    _userObjects.removeLast();
    notifyListeners();
  }
}

class PageBuilder {
  final UserObject homeRoutePath;

  PageBuilder(this.homeRoutePath);
  Page getPage(UserObject path) {
    switch (path.pageType) {
      case Screen1:
        return MaterialPage(child: Screen1());
      case Screen2:
        return MaterialPage(
            key: ValueKey('providerDetail ${path.param}'),
            child: Screen2(
              path.param.toString(),
            ));
      case Screen3:
        return MaterialPage(child: Screen3(path.param.toString()));
      default:
        return MaterialPage(
            child: Scaffold(
          body: Center(
            child: Text('Unknown route'),
          ),
        ));
    }
  }

  dynamic get page => getPage(homeRoutePath);
}
