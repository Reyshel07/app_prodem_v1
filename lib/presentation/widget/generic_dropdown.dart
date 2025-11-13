import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';

class DropdownOption {
  final String id;
  final String label;
  DropdownOption({required this.id, required this.label});
}

class GenericDropdown extends StatelessWidget {
  final String hint;
  final List<DropdownOption> items;
  final String? valueId;
  final ValueChanged<String?> onChanged;
  final double height;
  final double topPadding;

  const GenericDropdown({
    super.key,
    required this.hint,
    required this.items,
    required this.onChanged,
    required this.topPadding,
    this.valueId,
    this.height = 56,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 4,
        child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.green),
            borderRadius: BorderRadius.circular(11),
          ),
          child: DropdownButton<String>(
            padding: EdgeInsets.all(10),
            isExpanded: true,
            underline: const SizedBox(),
            value: valueId,
            hint: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                hint,
                style: AppTextStyles.mainStyleGreen14Bold(context),
              ),
            ),
            items: items
                .map(
                  (opt) => DropdownMenuItem<String>(
                    value: opt.id,
                    child: Text(opt.label),
                  ),
                )
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
