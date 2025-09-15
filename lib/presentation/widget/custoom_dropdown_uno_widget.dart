import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String label;
  final T? selectedValue;
  final List<T> items;
  final String Function(T) itemLabel;
  final ValueChanged<T?> onChanged;
  final double smallSpacing;
  final double letterSize;
  final double topPadding;
  final Size screenSize;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
    required this.smallSpacing,
    required this.letterSize,
    required this.topPadding,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: letterSize,
            fontStyle: FontStyle.italic,
            color: Theme.of(context).colorScheme.blue,
          ),
        ),
        SizedBox(height: smallSpacing * 0.5),
        Container(
          padding: EdgeInsets.all(topPadding * 0.01),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.green),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: selectedValue,
              isExpanded: true,
              items: items.map((item) {
                return DropdownMenuItem<T>(
                  value: item,
                  child: Text(
                    itemLabel(item),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.blue,
                      fontSize: 16,
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
              icon: Icon(Icons.arrow_drop_down),
            ),
          ),
        ),
      ],
    );
  }
}
