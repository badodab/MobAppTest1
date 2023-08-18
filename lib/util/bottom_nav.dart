import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jaehub/config/constant.dart';

class BottomNav1 extends StatelessWidget {
  const BottomNav1({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
			valueListenable: notif.bottomNavigationNotifier,
			builder: (context, value, child) {
        return BottomNavigationBar(
					currentIndex: value,
          onTap: (value) {
            if (value == 0) {
            } else if (value == 1) {
              // Navigator.pushNamed(context, '/cart');
            } else if (value == 2) {
              // Navigator.pushNamed(context, '/settings');
            }
            notif.bottomNavigationNotifier.value = value;
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          ],
        );
			},
    );
  }
}
