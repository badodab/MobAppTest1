import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jaehub/config/constant.dart';
import 'package:jaehub/models/theme_class.dart';
import 'package:jaehub/pages/add_to_cart.dart';
import 'package:jaehub/pages/how_to_pay.dart';
import 'package:jaehub/pages/login.dart';
import 'package:jaehub/pages/search.dart';
import 'package:jaehub/pages/selector_page.dart';
import 'package:jaehub/pages/settings.dart';
import 'package:jaehub/util/custom_http_client.dart';

Future main() async {
  HttpOverrides.global = CustomHttpClient();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ValueListenableBuilder(
        valueListenable: notif.darkModeNotifier,
        builder: (context, isDark, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeClass.lightTheme,
            darkTheme: ThemeClass.darkTheme,
            initialRoute: '/',
            routes: {
              //   '/': (context) => const HomePage(),
              '/': (context) => const PageSelector(),
              '/login': ((context) => const LoginPage()),
              '/payment_how': (context) => const PaymentHow(),
              '/cart': (context) => const CartPage(),
              '/search': (context) => const SearchPage(),
              '/settings': (context) => const SettingsPage(),
            },
          );
        });
  }
}
