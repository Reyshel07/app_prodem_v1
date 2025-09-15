import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';

//Container
class Container1 extends StatelessWidget {
  const Container1({
    super.key,
    required this.screenSize,
    required this.letterSize,
    required this.lblTextField,
    required this.icon,
    required this.onTap,
    required this.smallSpacing,
  });

  final Size screenSize;
  final double letterSize;
  final String lblTextField;
  final VoidCallback onTap;
  final IconData icon;
  final double smallSpacing;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).colorScheme.brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        width: screenSize.width * 0.23,
        height: screenSize.height * 0.1,
        child: Card(
          color: isDark ? Colors.grey[900] : Colors.white,
          elevation: smallSpacing * 0.5,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  lblTextField,
                  style: AppTextStyles.mainStyleGreen10Bold(context),
                  textAlign: TextAlign.center,
                ),
                Icon(
                  icon,
                  size: smallSpacing * 1.3,
                  color: Theme.of(context).colorScheme.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//ListTitle
class ListTitle1 extends StatelessWidget {
  const ListTitle1({
    super.key,
    required this.smallSpacing,
    required this.lblTextField,
    required this.letterSize,
    required this.icon,
    required this.onTap1,
  });

  final double smallSpacing;
  final String lblTextField;
  final double letterSize;
  final VoidCallback onTap1;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            lblTextField,
            style: AppTextStyles.mainStyleGreen14Bold(context),
          ),
          Icon(icon, color: Theme.of(context).colorScheme.green),
        ],
      ),
      onTap: () {
        onTap1();
      },
    );
  }
}

// text
class Text2 extends StatelessWidget {
  const Text2({
    super.key,
    required this.letterSize,
    required this.lblTextField,
    required this.textAlign1,
  });
  final double letterSize;
  final String lblTextField;
  final TextAlign textAlign1;

  @override
  Widget build(BuildContext context) {
    return Text(
      lblTextField,
      style: TextStyle(fontSize: letterSize),
      textAlign: textAlign1,
    );
  }
}
