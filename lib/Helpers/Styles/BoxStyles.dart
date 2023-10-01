import 'package:flutter/material.dart';
import '../../main.dart';

class BoxStyles {
  static BoxDecoration shadowBox() {
    return BoxDecoration(
      color: Theme.of(globalNavigatorKey.currentContext!).colorScheme.onSecondary,
      borderRadius: BorderRadius.all(Radius.circular(6)),
      boxShadow: [
        BoxShadow(
          color: Theme.of(globalNavigatorKey.currentContext!).colorScheme.outline.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 4,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    );
  }
}
