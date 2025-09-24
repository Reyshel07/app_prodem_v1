import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';

class Butoon1 extends StatelessWidget {
  const Butoon1({super.key, required this.onTap, required this.lblTextField});
  final VoidCallback onTap;
  final String lblTextField;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.green,
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        lblTextField,
        style: AppTextStyles.mainStyleWhite16Bold(context),
      ),
    );
  }
}

class ButoonIcon1 extends StatelessWidget {
  const ButoonIcon1({
    super.key,
    required this.onTap,
    required this.lblTextField,
    required this.icon,
  });
  final VoidCallback onTap;
  final String lblTextField;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.green,
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              lblTextField,
              style: AppTextStyles.mainStyleWhite16Bold(context),
            ),
            Icon(icon, color: Theme.of(context).colorScheme.white),
          ],
        ),
      ),
    );
  }
}

class ElevateButton1 extends StatelessWidget {
  const ElevateButton1({
    super.key,
    required this.onTap,
    required this.lblTextField,
  });
  final VoidCallback onTap;
  final String lblTextField;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.green,
      ),
      child: Text(
        lblTextField,
        style: TextStyle(color: Theme.of(context).colorScheme.white),
      ),
    );
  }
}
