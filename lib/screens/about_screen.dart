import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;

import '../l10n/generated/app_localizations.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  static const contactEmail = 'huzaifa.khashan@gmail.com';
  static const contactPhone = '+963 981 787 496';
  static const githubUrl = 'https://github.com/huzaifakhashan';

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  int _selectedStars = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.aboutScreenTitle)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/icon/app_icon.png',
                width: 72,
                height: 72,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Center(
            child: Text(
              'Nova Store',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ),
          Center(
            child: Text(
              l10n.versionBuildLabel,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            l10n.aboutDescription,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 28),
          _Section(
            title: l10n.enjoyingNovaStore,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    final filled = index < _selectedStars;
                    return IconButton(
                      onPressed: () => _rate(index + 1),
                      icon: Icon(
                        filled ? Icons.star_rounded : Icons.star_border_rounded,
                        color: Colors.amber.shade600,
                        size: 30,
                      ),
                    );
                  }),
                ),
                if (_selectedStars > 0)
                  Text(
                    l10n.thanksForRating(_selectedStars),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _Section(
            title: l10n.getInTouch,
            child: Column(
              children: [
                _ContactRow(
                  icon: Icons.email_outlined,
                  label: AboutScreen.contactEmail,
                  onCopy: () => _copyToClipboard(
                    AboutScreen.contactEmail,
                    l10n.emailCopied,
                  ),
                ),
                const SizedBox(height: 8),
                _ContactRow(
                  icon: Icons.phone_outlined,
                  label: AboutScreen.contactPhone,
                  onCopy: () => _copyToClipboard(
                    AboutScreen.contactPhone,
                    l10n.phoneCopied,
                  ),
                ),
                const SizedBox(height: 8),
                _ContactRow(
                  icon: Icons.code_rounded,
                  label: AboutScreen.githubUrl,
                  onCopy: () => _copyToClipboard(
                    AboutScreen.githubUrl,
                    l10n.githubCopied,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Center(
            child: Text(
              l10n.builtWithFlutter,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _rate(int stars) {
    setState(() => _selectedStars = stars);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).thanksForRatingDemo(stars)),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  void _copyToClipboard(String value, String message) {
    Clipboard.setData(ClipboardData(text: value));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
      );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.icon,
    required this.label,
    required this.onCopy,
  });

  final IconData icon;
  final String label;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surfaceContainerHigh,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onCopy,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              Icon(icon, color: theme.colorScheme.primary),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.copy_rounded,
                size: 18,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}
