import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';

/// The set of app categories shown throughout the store.
enum AppCategory {
  games,
  social,
  productivity,
  photography,
  music,
  health,
  education,
  finance,
  entertainment,
  tools;

  String label(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    switch (this) {
      case AppCategory.games:
        return l10n.categoryGames;
      case AppCategory.social:
        return l10n.categorySocial;
      case AppCategory.productivity:
        return l10n.categoryProductivity;
      case AppCategory.photography:
        return l10n.categoryPhotography;
      case AppCategory.music:
        return l10n.categoryMusic;
      case AppCategory.health:
        return l10n.categoryHealth;
      case AppCategory.education:
        return l10n.categoryEducation;
      case AppCategory.finance:
        return l10n.categoryFinance;
      case AppCategory.entertainment:
        return l10n.categoryEntertainment;
      case AppCategory.tools:
        return l10n.categoryTools;
    }
  }

  IconData get icon {
    switch (this) {
      case AppCategory.games:
        return Icons.sports_esports_rounded;
      case AppCategory.social:
        return Icons.forum_rounded;
      case AppCategory.productivity:
        return Icons.task_alt_rounded;
      case AppCategory.photography:
        return Icons.photo_camera_rounded;
      case AppCategory.music:
        return Icons.headphones_rounded;
      case AppCategory.health:
        return Icons.favorite_rounded;
      case AppCategory.education:
        return Icons.school_rounded;
      case AppCategory.finance:
        return Icons.account_balance_wallet_rounded;
      case AppCategory.entertainment:
        return Icons.movie_rounded;
      case AppCategory.tools:
        return Icons.build_rounded;
    }
  }
}
