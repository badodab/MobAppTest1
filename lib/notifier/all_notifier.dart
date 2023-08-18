import 'package:flutter/cupertino.dart';
import 'package:jaehub/models/dark_mode.dart';
import 'package:jaehub/notifier/cart_product_notifier.dart';
import 'package:jaehub/notifier/dark_mode_notifier.dart';

class AllNotifier {
  CartProductNotifier cartProductNotifier = CartProductNotifier([]);
	final ValueNotifier<PageController> productViewPageControllerNotifier = ValueNotifier(PageController());
	final ValueNotifier<int> bottomNavigationNotifier = ValueNotifier(0);
	final ValueNotifier<double> checkOutPrice = ValueNotifier(0);
	final ValueNotifier<bool> darkModeNotifier = ValueNotifier(false);
	final ValueNotifier<double> cartSummationNotifier = ValueNotifier(0);

}

