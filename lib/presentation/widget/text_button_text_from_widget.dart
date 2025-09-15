import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFromn1 extends StatelessWidget {
  const TextFromn1({
    super.key,
    required this.lblTextField,
    required this.passwordController,
    required this.colorIcon,
  });
  final String lblTextField;
  final TextEditingController passwordController;
  final Color colorIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: lblTextField,
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.green),
        filled: true,
        fillColor: Theme.of(context).colorScheme.leadBajito,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }
}

class Text1 extends StatelessWidget {
  const Text1({
    super.key,
    required this.letterSize,
    required this.lblTextField,
    required this.colorText,
  });

  final double letterSize;
  final String lblTextField;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Text(
      lblTextField,
      style: GoogleFonts.timmana(
        color: colorText,
        fontSize: letterSize * 0.017,
      ),
      textAlign: TextAlign.center,
    );
  }
}
