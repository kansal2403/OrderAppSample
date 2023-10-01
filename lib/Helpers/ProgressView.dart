import 'package:flutter/material.dart';
import '../main.dart';

class ProgressView {
  static Widget showProgress() {
    return Container(
      color: Theme.of(globalNavigatorKey.currentContext!).colorScheme.shadow,
      child: Center(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(globalNavigatorKey.currentContext!)
                  .colorScheme
                  .background,
            ),
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: CircularProgressIndicator())),
      ),
    );
  }
}
