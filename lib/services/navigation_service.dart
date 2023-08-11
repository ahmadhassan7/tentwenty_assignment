import 'package:flutter/material.dart';

import '../../main.dart';

class NavigationService {
  static push(Widget widget, {dynamic arguments}) {
    return navigatorKey.currentState?.push(MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ));
  }

  static pushReplacement(Widget widget, {dynamic arguments}) {
    return navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ));
  }

  static pushAndRemoveUntil(Widget widget, {dynamic arguments}) {
    return navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
      ),
      (route) => false,
    );
  }

  static pop([value]) {
    return navigatorKey.currentState?.pop(value);
  }

  static BuildContext getNavigationContext() {
    return navigatorKey.currentState!.context;
  }
}
