import 'package:flutter/material.dart';

extension ExtensionsLinghTheme on ColorScheme {
  Color get green => const Color(0XFF007A33);
  Color get black => const Color.fromARGB(0, 0, 0, 0);
  Color get white => const Color.fromARGB(255, 255, 255, 255);
  Color get blue => const Color(0xFF004D99);
  Color get bluebajo => const Color.fromARGB(255, 178, 200, 223);
  Color get lead => const Color.fromARGB(255, 189, 189, 197);
  Color get transparente => Colors.transparent;
  Color get alpa => Color.fromARGB(136, 102, 100, 100);
  Color get leadBajito => Color.fromARGB(255, 189, 189, 197).withOpacity(0.5);
  Color get blackBajo => Colors.black.withOpacity(0.2);
  Color get grey => Colors.grey;
  Color get red => const Color.fromARGB(255, 255, 0, 0);
}
