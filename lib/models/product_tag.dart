class ProductTag {
  String name;
  int quantity;
  String seo;

  ProductTag(this.name, this.quantity, this.seo);

  @override
  String toString() {
    // TODO: implement toString
    return '$name - $quantity - $seo';
    return super.toString();
  }
}
