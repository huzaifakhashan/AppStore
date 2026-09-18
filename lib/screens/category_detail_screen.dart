import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../l10n/generated/app_localizations.dart';
import '../models/app_info.dart';
import '../models/category.dart';
import '../widgets/app_list_tile.dart';
import 'app_details_screen.dart';

enum _SortOrder { rating, downloads, name }

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({super.key, required this.category});

  final AppCategory category;

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  _SortOrder _sort = _SortOrder.rating;

  List<AppInfo> get _sortedApps {
    final apps = [...MockData.byCategory(widget.category)];
    switch (_sort) {
      case _SortOrder.rating:
        apps.sort((a, b) => b.rating.compareTo(a.rating));
      case _SortOrder.downloads:
        apps.sort((a, b) => b.downloads.compareTo(a.downloads));
      case _SortOrder.name:
        apps.sort((a, b) => a.name.compareTo(b.name));
    }
    return apps;
  }

  @override
  Widget build(BuildContext context) {
    final apps = _sortedApps;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.label(context)),
        actions: [
          PopupMenuButton<_SortOrder>(
            initialValue: _sort,
            onSelected: (value) => setState(() => _sort = value),
            icon: const Icon(Icons.sort_rounded),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: _SortOrder.rating,
                child: Text(AppLocalizations.of(context).sortTopRated),
              ),
              PopupMenuItem(
                value: _SortOrder.downloads,
                child: Text(AppLocalizations.of(context).sortMostDownloaded),
              ),
              PopupMenuItem(
                value: _SortOrder.name,
                child: Text(AppLocalizations.of(context).sortNameAZ),
              ),
            ],
          ),
        ],
      ),
      body: apps.isEmpty
          ? Center(child: Text(AppLocalizations.of(context).noAppsInCategory))
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
