import 'package:flutter/material.dart';

import 'category.dart';
import 'review.dart';

/// A fictional marketplace listing. All data is invented for demo purposes.
class AppInfo {
  const AppInfo({
    required this.id,
    required this.name,
    required this.developer,
    required this.category,
    required this.tagline,
    required this.description,
    required this.rating,
    required this.ratingCount,
    required this.downloads,
    required this.sizeInMb,
    required this.price,
    required this.version,
    required this.updatedDaysAgo,
    required this.iconGlyph,
    required this.gradient,
    required this.screenshotCount,
    this.editorsChoice = false,
    this.containsAds = false,
    this.reviews = const [],
  });

  final String id;
  final String name;
  final String developer;
  final AppCategory category;
  final String tagline;
  final String description;
  final double rating;
  final int ratingCount;
  final int downloads;
  final double sizeInMb;
  final double price;
  final String version;
  final int updatedDaysAgo;
  final IconData iconGlyph;
  final List<Color> gradient;
  final int screenshotCount;
  final bool editorsChoice;
  final bool containsAds;
  final List<Review> reviews;

  bool get isFree => price == 0;

  /// Fraction of 5-star, 4-star, ... 1-star reviews, derived deterministically
  /// from [rating] so every listing has a plausible-looking distribution.
  List<double> get ratingDistribution {
    final base = rating.clamp(1.0, 5.0);
    final weights = List<double>.generate(5, (i) {
      final star = 5 - i;
      final distance = (star - base).abs();
      return 1 / (1 + distance * distance * 1.6);
    });
    final total = weights.reduce((a, b) => a + b);
    return weights.map((w) => w / total).toList();
  }
}
