import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../main.dart';

class AppToast {
  static void showToast(String title) {
    Fluttertoast.showToast(
        msg: title,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Theme.of(globalNavigatorKey.currentContext!)
            .colorScheme
            .tertiaryContainer,
        textColor: Theme.of(globalNavigatorKey.currentContext!)
            .colorScheme
            .onSecondary,
        fontSize: 16.0);
  }
}
