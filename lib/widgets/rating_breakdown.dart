import 'package:flutter/material.dart';

import '../models/app_info.dart';
import '../utils/formatters.dart';
import 'rating_stars.dart';

/// Overall score on the left, 5-to-1-star distribution bars on the right.
class RatingBreakdown extends StatelessWidget {
  const RatingBreakdown({super.key, required this.app});

  final AppInfo app;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final distribution = app.ratingDistribution;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              app.rating.toStringAsFixed(1),
              style: theme.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            RatingStars(rating: app.rating, size: 16),
            const SizedBox(height: 4),
            Text(
              formatCount(app.ratingCount),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            children: List.generate(5, (i) {
              final star = 5 - i;
              final fraction = distribution[i];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    Text('$star', style: theme.textTheme.bodySmall),
                    const SizedBox(width: 6),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: fraction,
                          minHeight: 6,
                          backgroundColor: theme.colorScheme.surfaceContainerHighest,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
