import 'package:flutter/material.dart';
import 'package:jaehub/config/constant.dart';
import 'package:jaehub/util/bottom_nav.dart';
import 'package:jaehub/util/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.shopping_bag_outlined),
        title: const Text("Shopping Cart"),
        actions: const [
          // TextButton(
          //   onPressed: () {},
          //   child: const Text(
          //     'Edit',
          //     style: TextStyle(
          //       color: Colors.white,
          //     ),
          //   ),
          // )
        ],
      ),
      bottomNavigationBar: const BottomNav1(),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: notif.cartProductNotifier,
              builder: (context, value, child) => ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: value.length,
                itemBuilder: (context, index) {
                  EdgeInsets spacing = EdgeInsets.zero;
                  if (index == 0) {
                    spacing = const EdgeInsets.symmetric(vertical: 8);
                  } else {
                    spacing = const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 8);
                  }

                  return Container(
                    padding: spacing,
                    child: CartItem(cartProduct: value[index]),
                  );
                },
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: notif.cartProductNotifier,
            builder: (context, value, child) {
              if (value.isEmpty) return const SizedBox.shrink();
              return Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: notif.cartSummationNotifier,
                    builder: (context, summed, child) => Text('Total: $summed'),
                  ),
                  Material(
                    child: InkWell(
                      highlightColor: Colors.orange,
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        color: Colors.red.withAlpha(200),
                        height: 50,
                        child: const Text('Checkout', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
