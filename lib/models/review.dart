class Review {
  int id;
  int stars;
  String review;
  late DateTime reviewedAt;

  Review(this.id, this.stars, this.review, {DateTime? reviewedAt}) {
    this.reviewedAt = reviewedAt ?? DateTime.now();
  }
}
