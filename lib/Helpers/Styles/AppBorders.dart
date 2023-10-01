import 'package:flutter/material.dart';
import '../../main.dart';

class AppBorders {
  static Color border =
      Theme.of(globalNavigatorKey.currentContext!).colorScheme.outline;

  static RoundedRectangleBorder itemCardBorder() {
    return RoundedRectangleBorder(
      side: BorderSide(
        color: border,
        width: 0.2,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
