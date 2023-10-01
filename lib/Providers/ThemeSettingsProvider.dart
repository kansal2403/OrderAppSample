import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, Brightness>((ref) {
  return ThemeNotifier(Brightness.dark);
});

class ThemeNotifier extends StateNotifier<Brightness> {

  ThemeNotifier(super.state) {
    startMonitoring();
  }

  void currentTheme() async {
    _updateState();
  }

  void updateTheme() {
    _updateState();
  }

  void startMonitoring() {
    SchedulerBinding.instance.platformDispatcher.onPlatformBrightnessChanged =
        () {
          _updateState();
    };
  }

  void _updateState() {
    state = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  }
}
