import 'package:flutter/widgets.dart';

import '../l10n/generated/app_localizations.dart';

/// Compact number formatting (1_200_000 -> "1.2M"). Kept locale-neutral —
/// these Latin abbreviations are standard in Arabic tech UIs too.
String formatCount(int value) {
  if (value >= 1000000000) {
    return '${_trim(value / 1000000000)}B+';
  }
  if (value >= 1000000) {
    return '${_trim(value / 1000000)}M+';
  }
  if (value >= 1000) {
    return '${_trim(value / 1000)}K+';
  }
  return '$value';
}

String _trim(double value) {
  final rounded = (value * 10).round() / 10;
  if (rounded == rounded.roundToDouble()) {
    return rounded.toInt().toString();
  }
  return rounded.toString();
}

String formatSize(double sizeInMb) {
  if (sizeInMb >= 1024) {
    return '${(sizeInMb / 1024).toStringAsFixed(1)} GB';
  }
  return '${sizeInMb.toStringAsFixed(0)} MB';
}

String formatPrice(BuildContext context, double price) {
  if (price == 0) return AppLocalizations.of(context).free;
  return '\$${price.toStringAsFixed(2)}';
}

String formatRelativeDays(BuildContext context, int daysAgo) {
  final l10n = AppLocalizations.of(context);
  if (daysAgo <= 0) return l10n.today;
  if (daysAgo == 1) return l10n.yesterday;
  if (daysAgo < 30) return l10n.daysAgo(daysAgo);
  if (daysAgo < 365) return l10n.monthsAgo((daysAgo / 30).floor());
  return l10n.yearsAgo((daysAgo / 365).floor());
}
