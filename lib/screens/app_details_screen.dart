import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/generated/app_localizations.dart';
import '../models/app_info.dart';
import '../models/review.dart';
import '../state/library_provider.dart';
import '../utils/formatters.dart';
import '../widgets/app_icon.dart';
import '../widgets/install_button.dart';
import '../widgets/rating_breakdown.dart';
import '../widgets/rating_stars.dart';
import '../widgets/screenshot_placeholder.dart';

class AppDetailsScreen extends StatefulWidget {
  const AppDetailsScreen({super.key, required this.app});

  final AppInfo app;

  @override
  State<AppDetailsScreen> createState() => _AppDetailsScreenState();
}

class _AppDetailsScreenState extends State<AppDetailsScreen> {
  bool _descriptionExpanded = false;

  @override
  Widget build(BuildContext context) {
    final app = widget.app;
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final library = context.watch<LibraryProvider>();
    final wishlisted = library.isWishlisted(app.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(app.name),
        actions: [
          IconButton(
            icon: Icon(
              wishlisted ? Icons.favorite_rounded : Icons.favorite_border_rounded,
              color: wishlisted ? Colors.redAccent : null,
            ),
            tooltip: wishlisted ? l10n.removeFromWishlist : l10n.addToWishlist,
            onPressed: () => library.toggleWishlist(app.id),
          ),
          IconButton(
            icon: const Icon(Icons.share_outlined),
            tooltip: l10n.share,
            onPressed: () {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(l10n.sharingNotWired),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 32),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppIcon(app: app, size: 84),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        app.name,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        app.developer,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        app.tagline,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _StatColumn(
                  value: app.rating.toStringAsFixed(1),
                  label: l10n.reviewsCount(formatCount(app.ratingCount)),
                  icon: Icons.star_rounded,
                ),
                _divider(context),
                _StatColumn(
                  value: formatCount(app.downloads),
                  label: l10n.downloadsLabel,
                  icon: Icons.download_rounded,
                ),
                _divider(context),
                _StatColumn(
                  value: app.containsAds ? l10n.adsValue : '3+',
                  label: app.containsAds ? l10n.containsAds : l10n.noAds,
                  icon: Icons.shield_moon_rounded,
                ),
                _divider(context),
                _StatColumn(
                  value: formatSize(app.sizeInMb),
                  label: l10n.sizeLabel,
                  icon: Icons.sd_storage_rounded,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
            child: SizedBox(
              width: double.infinity,
              child: InstallButton(app: app),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 210,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: app.screenshotCount,
              separatorBuilder: (_, _) => const SizedBox(width: 10),
              itemBuilder: (context, index) =>
                  ScreenshotPlaceholder(app: app, index: index),
            ),
          ),
          const SizedBox(height: 8),
          _SectionCard(
            title: l10n.aboutThisApp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  app.description,
                  maxLines: _descriptionExpanded ? null : 3,
                  overflow: _descriptionExpanded
                      ? TextOverflow.visible
                      : TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium,
                ),
                TextButton(
                  onPressed: () => setState(
                    () => _descriptionExpanded = !_descriptionExpanded,
                  ),
                  child: Text(_descriptionExpanded ? l10n.showLess : l10n.readMore),
                ),
                const Divider(height: 24),
                _InfoRow(label: l10n.versionLabel, value: app.version),
                _InfoRow(
                  label: l10n.updatedLabel,
                  value: formatRelativeDays(context, app.updatedDaysAgo),
                ),
                _InfoRow(label: l10n.categoryLabel, value: app.category.label(context)),
                _InfoRow(label: l10n.priceLabel, value: formatPrice(context, app.price)),
              ],
            ),
          ),
          _SectionCard(
            title: l10n.ratingsAndReviews,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingBreakdown(app: app),
                const SizedBox(height: 16),
                for (final review in app.reviews) _ReviewTile(review: review),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider(BuildContext context) => Container(
    height: 36,
    width: 1,
    color: Theme.of(context).colorScheme.outlineVariant,
  );
}

class _StatColumn extends StatelessWidget {
  const _StatColumn({required this.value, required this.label, required this.icon});

  final String value;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        children: [
          Icon(icon, size: 18, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(height: 4),
          Text(value, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontSize: 10.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          )),
          Text(value, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _ReviewTile extends StatelessWidget {
  const _ReviewTile({required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Text(
                  review.author.substring(0, 1),
                  style: TextStyle(color: theme.colorScheme.onPrimaryContainer),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review.author, style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    )),
                    Row(
                      children: [
                        RatingStars(rating: review.rating, size: 12),
                        const SizedBox(width: 6),
                        Text(
                          formatRelativeDays(context, review.daysAgo),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(review.comment, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(Icons.thumb_up_outlined, size: 14, color: theme.colorScheme.onSurfaceVariant),
              const SizedBox(width: 4),
              Text(
                AppLocalizations.of(context).helpfulCount(review.helpfulCount),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
