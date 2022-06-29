class Product {
  String name;
  int harga;
  int hargaPromo;
  bool isPromo;
  String description;
  List<String> imageUrl;
  double rating;
  int ratingCounter;

  Product(
    this.name,
    this.harga,
    this.description,
    this.imageUrl, {
    this.hargaPromo = 0,
    this.isPromo = false,
    this.rating = 0.0,
    this.ratingCounter = 0,
  });
}
