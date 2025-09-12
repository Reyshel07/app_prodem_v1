import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SeisDigitosText extends StatelessWidget {
  const SeisDigitosText({
    super.key,
    required this.screenSize,
    required this.secretkController,
  });

  final Size screenSize;
  final TextEditingController secretkController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize.width * 0.22,
      child: TextFormField(
        controller: secretkController,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(6),
        ],
        decoration: InputDecoration(
          hintText: '******',
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.alpa),
          suffixIconColor: Theme.of(context).colorScheme.green,
          filled: true,
          fillColor: Theme.of(context).colorScheme.transparente,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.green,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.green,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.transparente,
              width: 2,
            ),
          ),
        ),
        style: TextStyle(color: Theme.of(context).colorScheme.green),
      ),
    );
  }
}
