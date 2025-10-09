import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class ReportMovementByPErsonAndDateScreen extends StatefulWidget {
  const ReportMovementByPErsonAndDateScreen({super.key});

  @override
  State<ReportMovementByPErsonAndDateScreen> createState() =>
      _ReportMovementByPErsonAndDateScreenState();
}

class _ReportMovementByPErsonAndDateScreenState
    extends State<ReportMovementByPErsonAndDateScreen> {
  String? _selectedValueMoney;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.white,
        backgroundColor: Theme.of(context).colorScheme.green,
        title: Text(
          'Consultar Movimientos',
          style: AppTextStyles.mainStyleWhite18Bold(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(topPadding * 0.05),
        child: Column(
          children: [
            _buildDropdown(
              title: 'MONEDA TRANSFERENCIA',
              items: [],
              value: _selectedValueMoney,
              onChanged: (newValue) {
                setState(() => _selectedValueMoney = newValue);
              },
              smallSpacing: smallSpacing,
            ),
            Text('Fechas:', style: AppTextStyles.mainStyleGreen12Bold(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String title,
    required List<String> items,
    required String? value,
    required void Function(String?) onChanged,
    required double smallSpacing,
  }) {
    return SizedBox(
      child: Card(
        elevation: smallSpacing * 0.5,
        child: Container(
          width: double.infinity,
          height: smallSpacing * 3,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.green),
            borderRadius: BorderRadius.all(radiusCircular(11)),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            underline: const SizedBox(),
            padding: EdgeInsetsGeometry.all(smallSpacing * 0.5),
            hint: Text(
              title,
              style: AppTextStyles.mainStyleGreen14Bold(context),
            ),
            value: value,
            items: items
                .map((val) => DropdownMenuItem(value: val, child: Text(val)))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
