import 'package:flutter/material.dart';

/// This class is used to configure the routes of the app.
class RouteConfig {
  static push(BuildContext context, Widget widget) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return widget;
        },
      ),
    );
  }

  static pushReplacement(BuildContext context, Widget widget) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return widget;
        },
      ),
    );
  }
}
