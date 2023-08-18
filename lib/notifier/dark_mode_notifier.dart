import 'package:flutter/material.dart';
import 'package:jaehub/models/dark_mode.dart';

class DarkModeNotifier extends ValueNotifier<DarkMode> {
  DarkModeNotifier(super.value);

  // final ValueNotifier<bool> isDarkMode = ValueNotifier(false);
  // final ValueNotifier<String> brigtnessText = ValueNotifier('Dark Mode');

  setMode(mode) {
    value.mode = mode;
    value.text = mode ? 'Dark Mode' : 'Light Mode';
    notifyListeners();
  }
}
