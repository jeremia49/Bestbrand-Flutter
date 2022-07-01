class Product {
  int id;
  String name;
  int harga;
  int hargaPromo;
  bool isPromo;
  String description;
  List<String> imageUrl;
  double rating;
  int ratingCounter;
  List<String> tag;
  Map<String, String> externalStore;

  Product(
    this.id,
    this.name,
    this.harga,
    this.description,
    this.imageUrl, {
    this.hargaPromo = 0,
    this.isPromo = false,
    this.rating = 0.0,
    this.ratingCounter = 0,
    this.tag = const [],
    this.externalStore = const {},
  });
}
