import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/generated/app_localizations.dart';
import '../models/app_info.dart';
import '../state/library_provider.dart';
import '../utils/formatters.dart';

/// Drives the fake install/open/uninstall lifecycle for a single app.
class InstallButton extends StatelessWidget {
  const InstallButton({super.key, required this.app, this.dense = false});

  final AppInfo app;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final library = context.watch<LibraryProvider>();
    final status = library.statusFor(app.id);
    final l10n = AppLocalizations.of(context);

    switch (status) {
      case InstallStatus.notInstalled:
        return _FilledActionButton(
          dense: dense,
          label: app.isFree ? l10n.install : formatPrice(context, app.price),
          onPressed: () => library.install(app.id),
        );
      case InstallStatus.installing:
        return _InstallingIndicator(
          progress: library.progressFor(app.id),
          dense: dense,
          onCancel: () => library.cancelInstall(app.id),
        );
      case InstallStatus.installed:
        return _OutlinedActionButton(
          dense: dense,
          label: l10n.open,
          onPressed: () => _showOpenSnack(context),
          onLongPress: () => _confirmUninstall(context, library),
        );
    }
  }

  void _showOpenSnack(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).appWouldOpen(app.name)),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  void _confirmUninstall(BuildContext context, LibraryProvider library) {
    final l10n = AppLocalizations.of(context);
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.uninstallConfirmTitle(app.name)),
        content: Text(l10n.uninstallConfirmBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.cancel),
          ),
          FilledButton.tonal(
            onPressed: () {
              library.uninstall(app.id);
              Navigator.of(context).pop();
            },
            child: Text(l10n.uninstall),
          ),
        ],
      ),
    );
  }
}

class _FilledActionButton extends StatelessWidget {
  const _FilledActionButton({
    required this.label,
    required this.onPressed,
    required this.dense,
  });

  final String label;
  final VoidCallback onPressed;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dense ? 34 : 40,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: dense ? 14 : 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: dense ? 13 : 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _OutlinedActionButton extends StatelessWidget {
  const _OutlinedActionButton({
    required this.label,
    required this.onPressed,
    required this.dense,
    this.onLongPress,
  });

  final String label;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dense ? 34 : 40,
      child: OutlinedButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: dense ? 14 : 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: dense ? 13 : 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _InstallingIndicator extends StatelessWidget {
  const _InstallingIndicator({
    required this.progress,
    required this.dense,
    required this.onCancel,
  });

  final double progress;
  final bool dense;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dense ? 34 : 40,
      width: dense ? 34 : 40,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onCancel,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: dense ? 26 : 30,
              width: dense ? 26 : 30,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 2.5,
              ),
            ),
            Icon(Icons.close_rounded, size: dense ? 14 : 16),
          ],
        ),
      ),
    );
  }
}
