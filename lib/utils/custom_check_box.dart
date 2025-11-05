import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final String label;
  final ValueChanged<bool?> onChanged;
  final TextStyle styText;

  const CustomCheckBox({
    super.key,
    required this.value,
    required this.label,
    required this.onChanged,
    required this.styText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          checkColor: Theme.of(context).colorScheme.white,
          activeColor: Theme.of(context).colorScheme.green,
          side: BorderSide(color: Theme.of(context).colorScheme.green),
        ),
        Text(label, style: styText),
      ],
    );
  }
}
