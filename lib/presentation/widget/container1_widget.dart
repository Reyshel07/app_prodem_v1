import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:flutter/material.dart';

class Container2 extends StatelessWidget {
  const Container2({
    super.key,
    required this.screenSize,
    required this.smallSpacing,
    required this.letterSize,
    required this.lblTextField,
    required this.icon,
    required this.onTap,
  });

  final Size screenSize;
  final double smallSpacing;
  final double letterSize;
  final String lblTextField;
  final Icon icon;
  final VoidCallback onTap;
  //final Widget svg;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: screenSize.height * 0.15,
        width: screenSize.width * 0.4,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.transparente,
          border: Border.all(
            color: Theme.of(context).colorScheme.green,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon.icon,
              color: Theme.of(context).colorScheme.blue,
              size: smallSpacing * 2.3,
            ),
            SizedBox(height: smallSpacing * 0.05),
            Text(
              lblTextField,
              style: TextStyle(
                color: Theme.of(context).colorScheme.blue,
                fontSize: letterSize * 0.015,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
