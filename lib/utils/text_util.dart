import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  ///non-bold titles in green
  static TextStyle mainStyleGreen25(BuildContext context) => GoogleFonts.exo(
    color: Theme.of(context).colorScheme.green,
    fontSize: 25,
    fontWeight: FontWeight.w400,
  );

  ///titles in bold green
  static TextStyle mainStyleGreen25Bold(BuildContext context) =>
      GoogleFonts.exo(
        color: Theme.of(context).colorScheme.green,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      );

  static TextStyle mainStyleGreen16(BuildContext context) => GoogleFonts.exo(
    color: Theme.of(context).colorScheme.green,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle mainStyleGreen18Bold(BuildContext context) =>
      GoogleFonts.exo(
        color: Theme.of(context).colorScheme.green,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );
  static TextStyle mainStyleGreen18(BuildContext context) =>
      GoogleFonts.exo(color: Theme.of(context).colorScheme.green, fontSize: 18);
  static TextStyle mainStyleGreen14Bold(BuildContext context) =>
      GoogleFonts.exo(
        color: Theme.of(context).colorScheme.green,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      );
  static TextStyle mainStyleGreen14(BuildContext context) =>
      GoogleFonts.exo(color: Theme.of(context).colorScheme.green, fontSize: 14);
  static TextStyle mainStyleGreen12(BuildContext context) =>
      GoogleFonts.exo(color: Theme.of(context).colorScheme.green, fontSize: 12);
  static TextStyle mainStyleGreen10Bold(BuildContext context) =>
      GoogleFonts.exo(
        color: Theme.of(context).colorScheme.green,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      );
  static TextStyle mainStyleGreen16Bold(BuildContext context) =>
      GoogleFonts.exo(
        color: Theme.of(context).colorScheme.green,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );
  static TextStyle mainStyleWhite16(BuildContext context) => GoogleFonts.exo(
    color: Theme.of(context).colorScheme.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle mainStyleWhite16Bold(BuildContext context) =>
      GoogleFonts.exo(
        color: Theme.of(context).colorScheme.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );
  static TextStyle mainStyleWhite14Bold(BuildContext context) =>
      GoogleFonts.exo(
        color: Theme.of(context).colorScheme.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      );

  ///non-bold titles in white
  static TextStyle mainStyleWhite25(BuildContext context) => GoogleFonts.exo(
    color: Theme.of(context).colorScheme.white,
    fontSize: 25,
    fontWeight: FontWeight.w400,
  );

  ///bold titles in white
  static TextStyle mainStyleWhite25Bold(BuildContext context) =>
      GoogleFonts.exo(
        color: Theme.of(context).colorScheme.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      );
  static TextStyle mainStyleWhite18(BuildContext context) => GoogleFonts.exo(
    color: Theme.of(context).colorScheme.white,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static TextStyle mainStyleWhite18Bold(BuildContext context) =>
      GoogleFonts.exo(
        color: Theme.of(context).colorScheme.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );
}
