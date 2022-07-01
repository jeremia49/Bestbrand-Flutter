class Cart {
  int id;
  int quantity;
  late DateTime addedAt;

  Cart(this.id, {this.quantity = 1, DateTime? addedAt}) {
    this.addedAt = addedAt ?? DateTime.now();
  }
}
