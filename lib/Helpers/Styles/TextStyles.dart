import 'package:flutter/material.dart';
import '../../main.dart';

class TextStyles {
  static TextStyle titleLarge28() {
    return TextStyle(
        color: Theme.of(globalNavigatorKey.currentContext!)
            .colorScheme
            .onSecondary,
        fontWeight: FontWeight.bold,
        fontSize: 28);
  }

  static TextStyle titleMedium20(BuildContext context) {
    return TextStyle(
        color: Theme.of(context).colorScheme.tertiary,
        fontSize: 20,
        fontWeight: FontWeight.w500);
  }

  static TextStyle titleLarge26(BuildContext context) {
    return TextStyle(
        color: Theme.of(context).colorScheme.tertiary,
        fontSize: 26,
        fontWeight: FontWeight.w500);
  }

  static TextStyle text18(BuildContext context) {
    return TextStyle(
        color: Theme.of(context).colorScheme.tertiary,
        fontSize: 18,
        fontWeight: FontWeight.bold);
  }

  static TextStyle text16(BuildContext context) {
    return TextStyle(
        color: Theme.of(context).colorScheme.tertiary,
        fontSize: 16,
        fontWeight: FontWeight.bold);
  }

  static TextStyle errorText() {
    return TextStyle(
        color: Theme.of(globalNavigatorKey.currentContext!).colorScheme.error);
  }
}
