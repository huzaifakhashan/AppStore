import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/mock_data.dart';
import '../l10n/generated/app_localizations.dart';
import '../models/app_info.dart';
import '../state/library_provider.dart';
import '../utils/formatters.dart';
import '../widgets/app_list_tile.dart';
import 'app_details_screen.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final library = context.watch<LibraryProvider>();
    final installed = library.installedIds
        .map(MockData.byId)
        .whereType<AppInfo>()
        .toList();
    final totalSize = installed.fold<double>(0, (sum, app) => sum + app.sizeInMb);
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.myApps)),
      body: installed.isEmpty
          ? _EmptyLibrary(theme: theme)
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                  child: Text(
                    l10n.installedSummary(installed.length, formatSize(totalSize)),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                for (final app in installed)
                  AppListTile(
                    app: app,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => AppDetailsScreen(app: app)),
                    ),
                  ),
              ],
            ),
    );
  }
}

class _EmptyLibrary extends StatelessWidget {
  const _EmptyLibrary({required this.theme});

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
              Icons.apps_outlined,
              size: 48,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 12),
            Text(l10n.noAppsInstalled, style: theme.textTheme.titleMedium),
            const SizedBox(height: 4),
            Text(
              l10n.installedAppsHint,
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
