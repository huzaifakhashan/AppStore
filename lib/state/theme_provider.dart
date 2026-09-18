import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // Resolved once at startup instead of ThemeMode.system so the toggle's
  // "isDark" check always matches what is actually on screen — with
  // ThemeMode.system, the first tap would otherwise flip _mode from
  // system to dark while a system-dark device shows no visible change.
  ThemeMode _mode =
      WidgetsBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark
      ? ThemeMode.dark
      : ThemeMode.light;

  ThemeMode get mode => _mode;

  bool get isDark => _mode == ThemeMode.dark;

  void toggle() {
    _mode = isDark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
