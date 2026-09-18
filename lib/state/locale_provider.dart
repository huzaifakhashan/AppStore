import 'package:flutter/material.dart';

/// Tracks the user's chosen app language. A null [locale] means "follow the
/// system language" (falling back to English if the system language isn't
/// one Nova Store supports).
class LocaleProvider extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  void setLocale(Locale? locale) {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
  }
}
