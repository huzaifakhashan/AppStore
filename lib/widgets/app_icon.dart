import 'package:flutter/material.dart';

import '../models/app_info.dart';

/// A gradient-generated icon so the app never depends on network images.
class AppIcon extends StatelessWidget {
  const AppIcon({super.key, required this.app, this.size = 56});

  final AppInfo app;
  final double size;

  @override
  Widget build(BuildContext context) {
    final radius = size * 0.26;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: app.gradient,
        ),
        boxShadow: [
          BoxShadow(
            color: app.gradient.last.withValues(alpha: 0.35),
            blurRadius: size * 0.18,
            offset: Offset(0, size * 0.06),
          ),
        ],
      ),
      child: Icon(
        app.iconGlyph,
        color: Colors.white,
        size: size * 0.5,
      ),
    );
  }
}
