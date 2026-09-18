import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/generated/app_localizations.dart';
import '../state/library_provider.dart';
import '../state/locale_provider.dart';
import '../state/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final localeProvider = context.watch<LocaleProvider>();
    final library = context.watch<LibraryProvider>();
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: ListView(
        children: [
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode_outlined),
            title: Text(l10n.darkTheme),
            subtitle: Text(l10n.darkThemeSubtitle),
            value: themeProvider.isDark,
            onChanged: (_) => themeProvider.toggle(),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.language_rounded),
            title: Text(l10n.language),
          ),
          RadioGroup<Locale?>(
            groupValue: localeProvider.locale,
            onChanged: localeProvider.setLocale,
            child: Column(
              children: [
                RadioListTile<Locale?>(
                  title: Text(l10n.languageSystem),
                  value: null,
                ),
                RadioListTile<Locale?>(
                  title: Text(l10n.languageEnglish),
                  value: const Locale('en'),
                ),
                RadioListTile<Locale?>(
                  title: Text(l10n.languageArabic),
                  value: const Locale('ar'),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.restore_rounded),
            title: Text(l10n.resetDemoData),
            subtitle: Text(l10n.resetDemoDataSubtitle),
            onTap: () => _confirmReset(context, library),
          ),
        ],
      ),
    );
  }

  void _confirmReset(BuildContext context, LibraryProvider library) {
    final l10n = AppLocalizations.of(context);
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.resetDemoDataConfirmTitle),
        content: Text(l10n.resetDemoDataConfirmBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.cancel),
          ),
          FilledButton.tonal(
            onPressed: () {
              library.resetAll();
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(l10n.demoDataReset),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
            },
            child: Text(l10n.reset),
          ),
        ],
      ),
    );
  }
}
