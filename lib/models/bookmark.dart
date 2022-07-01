class Bookmark {
  int id;
  late DateTime bookmarkedAt;
  Bookmark(this.id, {DateTime? bookmarkedAt}) {
    this.bookmarkedAt = bookmarkedAt ?? DateTime.now();
  }
}
