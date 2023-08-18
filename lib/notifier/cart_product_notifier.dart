import 'package:flutter/cupertino.dart';
import 'package:jaehub/config/constant.dart';
import 'package:jaehub/models/cart_product.dart';
import 'package:jaehub/models/product.dart';

class CartProductNotifier extends ValueNotifier<List<CartProduct>> {
  CartProductNotifier(List<CartProduct> value) : super(value);

  void addOrIncrement(Product v) {
    int find = indexOfByProduct(v);
    if (find != -1) {
      ++value[find].productCount.value;
      notifyListeners();
      return;
    }

    value.add(CartProduct(v, ValueNotifier(1)));
    notifyListeners();
  }

  void add(CartProduct v) {
    if (indexOf(v) != -1) return;
    value.add(v);
    notifyListeners();
  }

  void remove(CartProduct v) {
    value.remove(v);
    notifyListeners();
  }

	int indexOfByProduct(Product p) {
    return (value.indexWhere((element) => element.product.id == p.id));
	}

  int indexOf(CartProduct v) {
    return (value.indexWhere((element) => element.product.id == v.product.id));
  }

  void updateEstimation() {
    double estimate = 0;
    for (var cp in value) {
      double totalCost = cp.productCount.value * (cp.product.price ?? 0);
      estimate += totalCost;
    }
    notif.cartSummationNotifier.value = estimate;
  }
}
