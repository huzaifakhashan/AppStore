import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/mock_data.dart';
import '../l10n/generated/app_localizations.dart';
import '../state/library_provider.dart';
import '../widgets/app_list_tile.dart';
import 'app_details_screen.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final library = context.watch<LibraryProvider>();
    final apps = MockData.apps
        .where((app) => library.isWishlisted(app.id))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).wishlistTitle)),
      body: apps.isEmpty
          ? _EmptyWishlist(theme: Theme.of(context))
          : ListView.builder(
              itemCount: apps.length,
              itemBuilder: (context, index) {
                final app = apps[index];
                return AppListTile(
                  app: app,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => AppDetailsScreen(app: app)),
                  ),
                );
              },
            ),
    );
  }
}

class _EmptyWishlist extends StatelessWidget {
  const _EmptyWishlist({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.favorite_border_rounded,
              size: 48,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 12),
            Text(l10n.wishlistEmpty, style: theme.textTheme.titleMedium),
            const SizedBox(height: 4),
            Text(
              l10n.wishlistEmptyHint,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
