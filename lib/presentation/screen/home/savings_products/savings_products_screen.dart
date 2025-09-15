import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavingsProductsScreen extends StatelessWidget {
  const SavingsProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(topPadding * 0.05),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, index) {
            return Card(
              elevation: smallSpacing * 0.5,
              child: ExpansionTile(
                shape: const Border.symmetric(horizontal: BorderSide.none),
                iconColor: Theme.of(context).colorScheme.black,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'lblTextField',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.green,
                        fontSize: letterSize * 0.020,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.abc_outlined,
                  color: Theme.of(context).colorScheme.green,
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: smallSpacing * 1),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.all(topPadding * 0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'text1',
                                  style: GoogleFonts.arvo(
                                    fontSize: letterSize * 0.015,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.green,
                                  ),
                                ),
                                Icon(
                                  Icons.abc_outlined,
                                  color: Theme.of(context).colorScheme.green,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
