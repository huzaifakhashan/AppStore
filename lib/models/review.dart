class Review {
  const Review({
    required this.author,
    required this.rating,
    required this.comment,
    required this.daysAgo,
    required this.helpfulCount,
  });

  final String author;
  final double rating;
  final String comment;
  final int daysAgo;
  final int helpfulCount;
}
