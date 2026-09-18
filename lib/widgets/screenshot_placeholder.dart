import 'package:flutter/material.dart';

import '../models/app_info.dart';

/// A generated "screenshot" mockup so the app never depends on network
/// images — each one is a deterministic, unique-looking gradient card.
class ScreenshotPlaceholder extends StatelessWidget {
  const ScreenshotPlaceholder({
    super.key,
    required this.app,
    required this.index,
  });

  final AppInfo app;
  final int index;

  @override
  Widget build(BuildContext context) {
    final colors = app.gradient;
    final t = (index + 1) / 6;
    final blended = Color.lerp(colors.first, colors.last, t)!;

    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [blended, colors.last],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 46,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const Spacer(),
            Icon(
              app.iconGlyph,
              color: Colors.white.withValues(alpha: 0.85),
              size: 40,
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 6),
            Container(
              width: 80,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
