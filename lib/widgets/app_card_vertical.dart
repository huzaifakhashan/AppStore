import 'package:flutter/material.dart';

import '../models/app_info.dart';
import '../utils/formatters.dart';
import 'app_icon.dart';
import 'install_button.dart';
import 'rating_stars.dart';

/// Compact card for horizontal carousels (top charts, new & updated, ...).
class AppCardVertical extends StatelessWidget {
  const AppCardVertical({super.key, required this.app, required this.onTap});

  final AppInfo app;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 132,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppIcon(app: app, size: 72),
              const SizedBox(height: 8),
              Text(
                app.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  RatingStars(rating: app.rating, size: 11),
                  const SizedBox(width: 3),
                  Text(
                    app.rating.toStringAsFixed(1),
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 6),
              InstallButton(app: app, dense: true),
              const SizedBox(height: 2),
              if (!app.isFree)
                Text(
                  formatSize(app.sizeInMb),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 11,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
