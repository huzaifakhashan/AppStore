import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../l10n/generated/app_localizations.dart';
import '../models/app_info.dart';
import '../models/category.dart';
import '../widgets/app_list_tile.dart';
import '../widgets/category_chip.dart';
import 'app_details_screen.dart';
import 'category_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<AppInfo> _results(BuildContext context) {
    final query = _query.trim().toLowerCase();
    if (query.isEmpty) return const [];
    return MockData.apps.where((app) {
      return app.name.toLowerCase().contains(query) ||
          app.developer.toLowerCase().contains(query) ||
          app.category.label(context).toLowerCase().contains(query) ||
          app.tagline.toLowerCase().contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final showingResults = _query.trim().isNotEmpty;
    final results = _results(context);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          autofocus: false,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: l10n.searchHint,
            border: InputBorder.none,
            suffixIcon: showingResults
                ? IconButton(
                    icon: const Icon(Icons.clear_rounded),
                    onPressed: () => setState(() {
                      _controller.clear();
                      _query = '';
                    }),
                  )
                : null,
          ),
          onChanged: (value) => setState(() => _query = value),
        ),
      ),
      body: showingResults
          ? (results.isEmpty
                ? _EmptyResults(query: _query)
                : ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final app = results[index];
                      return AppListTile(
                        app: app,
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => AppDetailsScreen(app: app),
                          ),
                        ),
                      );
                    },
                  ))
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  l10n.browseCategories,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: AppCategory.values
                      .map(
                        (category) => CategoryChip(
                          category: category,
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  CategoryDetailScreen(category: category),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
    );
  }
}

class _EmptyResults extends StatelessWidget {
  const _EmptyResults({required this.query});

  final String query;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 48,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.noResultsFor(query),
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              l10n.tryDifferentSearch,
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
