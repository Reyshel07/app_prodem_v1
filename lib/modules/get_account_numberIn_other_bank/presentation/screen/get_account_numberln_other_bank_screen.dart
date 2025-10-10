import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class AccountNumberlnOtherBankScreen extends StatefulWidget {
  const AccountNumberlnOtherBankScreen({super.key});

  @override
  State<AccountNumberlnOtherBankScreen> createState() =>
      _AccountNumberlnOtherBankScreenState();
}

class _AccountNumberlnOtherBankScreenState
    extends State<AccountNumberlnOtherBankScreen> {
  final TextEditingController nameOfTheDepositorController =
      TextEditingController(text: 'jade rashel piza quispe');
  bool isChecked = false;
  String? _selectedValue1;
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
          'Nuevo Depósito desde otras Entidades',
          style: AppTextStyles.mainStyleWhite18Bold(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(topPadding * 0.05),
        child: Column(
          children: [
            Text(
              'Datos del depósito realizado al QR',
              style: AppTextStyles.mainStyleGreen18Bold(context),
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() => isChecked = value ?? false);
                  },
                ),
                Text(
                  'Elegir de mis cuentas favoritas',
                  style: AppTextStyles.mainStyleGreen14Bold(context),
                ),
              ],
            ),
            TextFromFiel02(
              screenSize: screenSize,
              smallSpacing: smallSpacing,
              userController: nameOfTheDepositorController,
              lbText: 'Nombre del Depositante:',
            ),
            _buildDropdown(
              title: 'MONEDA TRANSFERENCIA',
              items: [],
              value: _selectedValue1,
              onChanged: (newValue) {
                setState(() => _selectedValue1 = newValue);
              },
              smallSpacing: smallSpacing,
            ),
            TextFromFiel02(
              screenSize: screenSize,
              smallSpacing: smallSpacing,
              userController: nameOfTheDepositorController,
              lbText: 'cuenta origen de ',
            ),
            TextFromFiel02(
              screenSize: screenSize,
              smallSpacing: smallSpacing,
              userController: nameOfTheDepositorController,
              lbText: 'cuenta origen de ',
            ),
            Text(
              'Datos de la cuenta a depositar en PRODEM',
              style: AppTextStyles.mainStyleGreen14Bold(context),
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() => isChecked = value ?? false);
                  },
                ),
                Text(
                  '¿Es a cuenta propia?',
                  style: AppTextStyles.mainStyleGreen14Bold(context),
                ),
              ],
            ),
            _buildDropdown(
              title: 'MONEDA TRANSFERENCIA',
              items: [],
              value: _selectedValue1,
              onChanged: (newValue) {
                setState(() => _selectedValue1 = newValue);
              },
              smallSpacing: smallSpacing,
            ),
            _buildDropdown(
              title: 'MONEDA TRANSFERENCIA',
              items: [],
              value: _selectedValue1,
              onChanged: (newValue) {
                setState(() => _selectedValue1 = newValue);
              },
              smallSpacing: smallSpacing,
            ),
            Card(
              elevation: smallSpacing * 0.5,
              child: Butoon1(onTap: () {}, lblTextField: 'CONTINUAR'),
            ),
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
