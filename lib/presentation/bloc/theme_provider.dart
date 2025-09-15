import 'package:app_prodem_v1/config/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = true;

  bool get isDark => !_isDark;

  ThemeData get currentTheme => AppTheme().theme(isDark);

  void changeTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
