import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBar1 extends StatelessWidget {
  const AppBar1({
    super.key,
    required this.screenSize,
    required this.smallSpacing,
    required this.letterSize,
    required this.lblTextField,
  });

  final Size screenSize;
  final double smallSpacing;
  final double letterSize;
  final String lblTextField;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height * 0.1,
      width: screenSize.width * 1,
      color: Theme.of(context).colorScheme.blue,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).colorScheme.white,
                size: smallSpacing * 1,
              ),
            ),
            SizedBox(width: smallSpacing * 0.001),
            Text(
              lblTextField,
              style: TextStyle(
                color: Colors.white,
                fontSize: letterSize * 0.020,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}

class TextFromField2 extends StatelessWidget {
  const TextFromField2({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Monto:',
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.green),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}
