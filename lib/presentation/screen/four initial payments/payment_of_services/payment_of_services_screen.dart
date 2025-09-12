import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:app_prodem_v1/presentation/widget/container1_widget.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';

class PaymentOfServicesScreen extends StatelessWidget {
  static const path = '/PaymentOfServicesScreen';
  static const name = 'PaymentOfServicesScreen';
  const PaymentOfServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.white,
        backgroundColor: Theme.of(context).colorScheme.green,
        title: Text(
          'Pago de Servicios',
          style: AppTextStyles.mainStyleWhite18Bold(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(topPadding * 0.05),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container2(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  letterSize: letterSize,
                  lblTextField: 'Mis Favoritos',
                  icon: Icon(Icons.ac_unit_outlined),
                  onTap: () {},
                ),
                Container2(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  letterSize: letterSize,
                  lblTextField: 'Electricidad',
                  icon: Icon(Icons.ac_unit_outlined),
                  onTap: () {
                    /* Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ElectricityScreen(),
                      ),
                    );*/
                  },
                ),
              ],
            ),
            SizedBox(height: smallSpacing * 0.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container2(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  letterSize: letterSize,
                  lblTextField: 'Agua Potable',
                  icon: Icon(Icons.ac_unit_outlined),
                  onTap: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DrinkingWaterScreen(),
                      ),
                    );*/
                  },
                ),
                Container2(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  letterSize: letterSize,
                  lblTextField: 'Gas Domiciliario',
                  icon: Icon(Icons.ac_unit_outlined),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: smallSpacing * 0.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container2(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  letterSize: letterSize,
                  lblTextField: 'Telecomunicaciones',
                  icon: Icon(Icons.ac_unit_outlined),
                  onTap: () {},
                ),
                Container2(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  letterSize: letterSize,
                  lblTextField: 'Identificaciones',
                  icon: Icon(Icons.ac_unit_outlined),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: smallSpacing * 0.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container2(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  letterSize: letterSize,
                  lblTextField: 'Seguridad Social',
                  icon: Icon(Icons.ac_unit_outlined),
                  onTap: () {},
                ),
                Container2(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  letterSize: letterSize,
                  lblTextField: 'Univercidades',
                  icon: Icon(Icons.ac_unit_outlined),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: smallSpacing * 0.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container2(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  letterSize: letterSize,
                  lblTextField: 'Seguros',
                  icon: Icon(Icons.ac_unit_outlined),
                  onTap: () {},
                ),
                Container2(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  letterSize: letterSize,
                  lblTextField: 'Empresas',
                  icon: Icon(Icons.ac_unit_outlined),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: smallSpacing * 0.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container2(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  letterSize: letterSize,
                  lblTextField: 'PromVida',
                  icon: Icon(Icons.ac_unit_outlined),
                  onTap: () {},
                ),
                Container2(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  letterSize: letterSize,
                  lblTextField: 'RUAT',
                  icon: Icon(Icons.ac_unit_outlined),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
