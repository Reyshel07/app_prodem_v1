import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpansionTitle1 extends StatelessWidget {
  const ExpansionTitle1({
    super.key,
    required this.smallSpacing,
    required this.letterSize,
    required this.screenSize,
    required this.topPadding,
    required this.lblTextField,
    required this.icon,
    required this.icon2,
    required this.data,
    required this.onTap,
    required this.text1,
  });

  final double smallSpacing;
  final double letterSize;
  final Size screenSize;
  final double topPadding;
  final String lblTextField;
  final IconData icon;
  final IconData icon2;
  final List<Map<String, dynamic>> data;
  final void Function(int index)? onTap;
  final String text1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: smallSpacing * 0.5,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.green),
          borderRadius: const BorderRadius.all(Radius.circular(13)),
        ),
        child: ExpansionTile(
          shape: const Border.symmetric(horizontal: BorderSide.none),
          iconColor: Theme.of(context).colorScheme.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lblTextField,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.green,
                  fontSize: letterSize * 0.020,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          trailing: Icon(icon, color: Theme.of(context).colorScheme.green),
          children: [
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: smallSpacing * 1),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (onTap != null) onTap!(index);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(topPadding * 0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item['text'] ?? '',
                                  style: GoogleFonts.arvo(
                                    fontSize: letterSize * 0.015,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.green,
                                  ),
                                ),
                                Icon(
                                  icon2,
                                  color: Theme.of(context).colorScheme.green,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: smallSpacing * 1),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
