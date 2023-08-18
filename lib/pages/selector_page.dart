import 'package:flutter/cupertino.dart';
import 'package:jaehub/config/constant.dart';
import 'package:jaehub/pages/add_to_cart.dart';
import 'package:jaehub/pages/home.dart';
import 'package:jaehub/pages/settings.dart';

class PageSelector extends StatefulWidget {
  const PageSelector({super.key});

  @override
  State<PageSelector> createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {
  List<Widget> screens = [
    const HomePage(),
    const CartPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notif.bottomNavigationNotifier,
      builder: (context, value, child) {
        return Stack(
            children: screens
                .asMap()
                .map<int, Widget>((i, screen) {
                  return MapEntry(
                      i,
                      Offstage(
                        offstage: i != value,
                        child: screen,
                      ));
                })
                .values
                .toList());
      },
    );
  }
}
