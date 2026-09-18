import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:app_store/app.dart';
import 'package:app_store/l10n/generated/app_localizations.dart';
import 'package:app_store/screens/about_screen.dart';
import 'package:app_store/screens/app_details_screen.dart';
import 'package:app_store/screens/settings_screen.dart';
import 'package:app_store/data/mock_data.dart';
import 'package:app_store/state/library_provider.dart';
import 'package:app_store/state/locale_provider.dart';
import 'package:app_store/state/theme_provider.dart';

List<SingleChildWidget> _providers({LibraryProvider? library}) {
  return [
    ChangeNotifierProvider(create: (_) => library ?? LibraryProvider()),
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => LocaleProvider()),
  ];
}

Widget _wrap(Widget child, {LibraryProvider? library}) {
  return MultiProvider(
    providers: _providers(library: library),
    child: Builder(
      builder: (context) {
        return MaterialApp(
          locale: context.watch<LocaleProvider>().locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: child,
        );
      },
    ),
  );
}

void main() {
  testWidgets('Home screen shows the store title and bottom navigation', (
    tester,
  ) async {
    await tester.pumpWidget(
      MultiProvider(providers: _providers(), child: const NovaStoreApp()),
    );
    await tester.pumpAndSettle();

    expect(find.text('Nova Store'), findsOneWidget);
    expect(find.text('Store'), findsOneWidget);
    expect(find.text('Library'), findsOneWidget);
  });

  testWidgets('Tapping install starts the fake install progress', (
    tester,
  ) async {
    final app = MockData.apps.first;
    await tester.pumpWidget(_wrap(AppDetailsScreen(app: app)));
    await tester.pumpAndSettle();

    expect(find.text('Install'), findsOneWidget);

    await tester.tap(find.text('Install'));
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Drawer opens from Home and links to Wishlist, Settings, and About', (
    tester,
  ) async {
    await tester.pumpWidget(
      MultiProvider(providers: _providers(), child: const NovaStoreApp()),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    expect(find.text('Nova Store'), findsWidgets);
    expect(find.text('Wishlist'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('About Nova Store'), findsOneWidget);

    await tester.tap(find.text('Wishlist'));
    await tester.pumpAndSettle();
    expect(find.text('Your wishlist is empty'), findsOneWidget);
  });

  testWidgets('Wishlisting an app from its details page surfaces it in the Wishlist screen', (
    tester,
  ) async {
    final app = MockData.apps.first;
    final library = LibraryProvider();
    await tester.pumpWidget(_wrap(AppDetailsScreen(app: app), library: library));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.favorite_border_rounded));
    await tester.pump();

    expect(library.isWishlisted(app.id), isTrue);
  });

  testWidgets('Settings screen resets demo data', (tester) async {
    final library = LibraryProvider();
    library.toggleWishlist(MockData.apps.first.id);

    await tester.pumpWidget(
      _wrap(const SettingsScreen(), library: library),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Reset demo data'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Reset'));
    await tester.pumpAndSettle();

    expect(library.wishlistIds, isEmpty);
  });

  testWidgets('Settings screen switches the app language to Arabic', (
    tester,
  ) async {
    await tester.pumpWidget(_wrap(const SettingsScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Language'), findsOneWidget);

    await tester.tap(find.text('العربية'));
    await tester.pumpAndSettle();

    expect(find.text('الإعدادات'), findsOneWidget);
    expect(find.text('الوضع الداكن'), findsOneWidget);
  });

  testWidgets('About screen lets you tap a star rating and shows thanks', (
    tester,
  ) async {
    await tester.pumpWidget(_wrap(const AboutScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Nova Store'), findsWidgets);

    final stars = find.byIcon(Icons.star_border_rounded);
    await tester.tap(stars.at(3));
    await tester.pump();

    expect(find.text('Thanks for the 4-star rating!'), findsOneWidget);
  });

  testWidgets('About screen shows contact details and copies them on tap', (
    tester,
  ) async {
    await tester.pumpWidget(_wrap(const AboutScreen()));
    await tester.pumpAndSettle();

    expect(find.text(AboutScreen.contactEmail), findsOneWidget);
    expect(find.text(AboutScreen.contactPhone), findsOneWidget);
    expect(find.text(AboutScreen.githubUrl), findsOneWidget);

    await tester.tap(find.text(AboutScreen.contactEmail));
    await tester.pump();

    expect(find.text('Email copied to clipboard'), findsOneWidget);
  });
}
