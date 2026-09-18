import 'dart:async';

import 'package:flutter/foundation.dart';

enum InstallStatus { notInstalled, installing, installed }

/// Tracks which apps are "installed" and drives the fake install progress
/// animation. All state is in-memory only (resets on app restart), which is
/// intentional for a demo/portfolio project — no backend required.
class LibraryProvider extends ChangeNotifier {
  final Map<String, double> _installProgress = {};
  final Set<String> _installedIds = {};
  final Set<String> _wishlistIds = {};
  final Map<String, Timer> _timers = {};

  InstallStatus statusFor(String appId) {
    if (_installedIds.contains(appId)) return InstallStatus.installed;
    if (_installProgress.containsKey(appId)) return InstallStatus.installing;
    return InstallStatus.notInstalled;
  }

  double progressFor(String appId) => _installProgress[appId] ?? 0;

  bool isInstalled(String appId) => _installedIds.contains(appId);

  bool isWishlisted(String appId) => _wishlistIds.contains(appId);

  List<String> get installedIds => _installedIds.toList(growable: false);

  List<String> get wishlistIds => _wishlistIds.toList(growable: false);

  void install(String appId) {
    if (statusFor(appId) != InstallStatus.notInstalled) return;
    _installProgress[appId] = 0;
    notifyListeners();

    _timers[appId] = Timer.periodic(const Duration(milliseconds: 120), (
      timer,
    ) {
      final current = _installProgress[appId] ?? 0;
      final next = (current + 0.12).clamp(0.0, 1.0);
      if (next >= 1.0) {
        timer.cancel();
        _timers.remove(appId);
        _installProgress.remove(appId);
        _installedIds.add(appId);
      } else {
        _installProgress[appId] = next;
      }
      notifyListeners();
    });
  }

  void cancelInstall(String appId) {
    _timers[appId]?.cancel();
    _timers.remove(appId);
    _installProgress.remove(appId);
    notifyListeners();
  }

  void uninstall(String appId) {
    _installedIds.remove(appId);
    notifyListeners();
  }

  void toggleWishlist(String appId) {
    if (!_wishlistIds.add(appId)) {
      _wishlistIds.remove(appId);
    }
    notifyListeners();
  }

  /// Uninstalls everything and clears the wishlist — used by the Settings
  /// screen so the demo can be reset to a clean slate without restarting.
  void resetAll() {
    for (final timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();
    _installProgress.clear();
    _installedIds.clear();
    _wishlistIds.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    for (final timer in _timers.values) {
      timer.cancel();
    }
    super.dispose();
  }
}
