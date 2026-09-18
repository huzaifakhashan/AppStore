import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/mock_data.dart';
import '../l10n/generated/app_localizations.dart';
import '../models/app_info.dart';
import '../models/category.dart';
import '../state/theme_provider.dart';
import '../widgets/app_card_vertical.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_list_tile.dart';
import '../widgets/category_chip.dart';
import '../widgets/featured_banner.dart';
import '../widgets/section_header.dart';
import 'app_details_screen.dart';
import 'category_detail_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    final l10n = AppLocalizations.of(context);
    final featured = MockData.editorsChoice;
    final topCharts = MockData.topCharts.take(10).toList();
    final newAndUpdated = MockData.newAndUpdated.take(10).toList();

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Nova Store'),
        actions: [
          IconButton(
            tooltip: theme.isDark ? l10n.switchToLightMode : l10n.switchToDarkMode,
            icon: Icon(theme.isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
            onPressed: theme.toggle,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: _SearchBarStub(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SearchScreen()),
              ),
            ),
          ),
          SizedBox(
            height: 52,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              scrollDirection: Axis.horizontal,
              itemCount: AppCategory.values.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final category = AppCategory.values[index];
                return CategoryChip(
                  category: category,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CategoryDetailScreen(category: category),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 190,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.86),
              itemCount: featured.length,
              itemBuilder: (context, index) {
                final app = featured[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: FeaturedBanner(
                    app: app,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => AppDetailsScreen(app: app)),
                    ),
                  ),
                );
              },
            ),
          ),
          SectionHeader(
            title: l10n.topCharts,
            onSeeAll: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const _AppRailScreen(
                  source: _RailSource.topCharts,
                ),
              ),
            ),
          ),
          _AppRail(apps: topCharts, ranked: true),
          SectionHeader(
            title: l10n.newAndUpdated,
            onSeeAll: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const _AppRailScreen(
                  source: _RailSource.newAndUpdated,
                ),
              ),
            ),
          ),
          _AppRail(apps: newAndUpdated, ranked: false),
        ],
      ),
    );
  }
}

class _SearchBarStub extends StatelessWidget {
  const _SearchBarStub({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(28),
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(Icons.search_rounded, color: theme.colorScheme.onSurfaceVariant),
              const SizedBox(width: 10),
              Text(
                AppLocalizations.of(context).searchHint,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppRail extends StatelessWidget {
  const _AppRail({required this.apps, required this.ranked});

  final List<AppInfo> apps;
  final bool ranked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: apps.length,
        separatorBuilder: (_, _) => const SizedBox(width: 4),
        itemBuilder: (context, index) {
          final app = apps[index];
          return AppCardVertical(
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

enum _RailSource { topCharts, newAndUpdated }

class _AppRailScreen extends StatelessWidget {
  const _AppRailScreen({required this.source});

  final _RailSource source;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final apps = source == _RailSource.topCharts
        ? MockData.topCharts
        : MockData.newAndUpdated;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          source == _RailSource.topCharts ? l10n.topCharts : l10n.newAndUpdated,
        ),
      ),
      body: ListView.builder(
        itemCount: apps.length,
        itemBuilder: (context, index) {
          final app = apps[index];
          return AppListTile(
            app: app,
            leadingRank: source == _RailSource.topCharts ? index + 1 : null,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => AppDetailsScreen(app: app)),
            ),
          );
        },
      ),
    );
  }
}
