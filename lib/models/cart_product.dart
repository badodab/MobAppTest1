import 'package:flutter/cupertino.dart';
import 'package:jaehub/models/product.dart';

class CartProduct {
  Product product;
  ValueNotifier<int> productCount = ValueNotifier(1);
  CartProduct(this.product, this.productCount);
  @override
  toString() {
    return product.id.toString();
  }
}
