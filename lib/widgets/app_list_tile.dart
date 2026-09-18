import 'package:flutter/material.dart';

import '../models/app_info.dart';
import 'app_icon.dart';
import 'install_button.dart';
import 'rating_stars.dart';

/// Horizontal row: icon, name/developer/rating, install action. Used in
/// search results, category listings, and the library screen.
class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    required this.app,
    required this.onTap,
    this.leadingRank,
    this.trailing,
  });

  final AppInfo app;
  final VoidCallback onTap;
  final int? leadingRank;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            if (leadingRank != null) ...[
              SizedBox(
                width: 20,
                child: Text(
                  '$leadingRank',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
            AppIcon(app: app, size: 52),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    app.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    app.category.label(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RatingStars(rating: app.rating, size: 13),
                      const SizedBox(width: 4),
                      Text(
                        app.rating.toStringAsFixed(1),
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            trailing ?? InstallButton(app: app, dense: true),
          ],
        ),
      ),
    );
  }
}
