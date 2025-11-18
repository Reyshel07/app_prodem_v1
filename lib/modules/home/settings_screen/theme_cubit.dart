import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark) {
    _loadTheme();
  }

  void _loadTheme() {
    final saved = SecureHive.readTheme(); // 'dark' o 'light'
    if (saved == 'light') {
      emit(ThemeMode.light);
    } else {
      emit(ThemeMode.dark);
    }
  }

  void toggleTheme() {
    final newTheme = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    emit(newTheme);
    SecureHive.writeTheme(newTheme == ThemeMode.dark ? 'dark' : 'light');
  }
}
