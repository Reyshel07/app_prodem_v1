import 'package:app_prodem_v1/presentation/screen/home/credit_products/widget/widget.dart';
import 'package:flutter/material.dart';

class CreditProductsScreen extends StatefulWidget {
  const CreditProductsScreen({super.key});

  @override
  State<CreditProductsScreen> createState() => _CreditProductsScreenState();
}

class _CreditProductsScreenState extends State<CreditProductsScreen> {
  Future<Map<String, dynamic>> fetchCreditData() async {
    await Future.delayed(Duration(seconds: 1));
    return {
      'consulta': 'Datos de consulta de créditos',
      'pago': 'Datos de pago de créditos',
      'terceros': 'Datos de pago de terceros',
    };
  }

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
          itemBuilder: (context, index) {
            return ExpansionTitle1(
              smallSpacing: smallSpacing,
              letterSize: letterSize,
              screenSize: screenSize,
              topPadding: topPadding,
              icon: Icons.credit_card,
              icon2: Icons.account_balance_wallet,
              lblTextField: 'Creditos',
              text1: 'Consulta',
              onTap: (selectedIndex) {
                if (selectedIndex == 0) {
                  Navigator.pushNamed(context, '/consultaCreditos');
                } else if (selectedIndex == 1) {
                  Navigator.pushNamed(context, '/pagoCredito');
                } else if (selectedIndex == 2) {
                  Navigator.pushNamed(context, '/pagoCreditoTerceros');
                }
              },
              data: [
                {'text': 'Consulta de Créditos'},
                {'text': 'Pago de Crédito'},
                {'text': 'Pago de Crédito de Terceros'},
              ],
            );
          },
        ),
      ),
    );
  }
}
