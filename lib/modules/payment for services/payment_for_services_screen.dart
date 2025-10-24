import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/screen/savings_products/savings_products_screen.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PaymentForServicesScreen extends StatefulWidget {
  const PaymentForServicesScreen({super.key});

  @override
  State<PaymentForServicesScreen> createState() =>
      _PaymentForServicesScreenState();
}

class _PaymentForServicesScreenState extends State<PaymentForServicesScreen> {
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
          'ProdemMóvil',
          style: AppTextStyles.mainStyleWhite18Bold(context),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Card(
                elevation: smallSpacing * 0.5,
                child: Container(
                  height: screenSize.height * 0.065,
                  width: screenSize.width * 0.95,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.green,
                    ),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(topPadding * 0.08),
                    child: Text(
                      'Mis Favoritos',
                      textAlign: TextAlign.start,
                      style: AppTextStyles.mainStyleGreen16Bold(context),
                    ),
                  ),
                ),
              ),
              ListTitlePrueba(
                topPadding: topPadding,
                smallSpacing: smallSpacing,
                letterSize: letterSize,
                title: 'Electricidad',
                icon: Icons.savings,
                column: Column(
                  children: [
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.compare_arrows,
                      title: 'CESSA',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.account_balance,
                      title: 'DELAPAZ',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.receipt_long,
                      title: 'ENDE DELBENI',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.compare_arrows,
                      title: 'ELFEC',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.send,
                      title: 'ENDE CORPORACIÓN',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.compare_arrows,
                      title: 'SEPSA',
                    ),

                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.confirmation_num,
                      title: 'CRE',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.confirmation_num,
                      title: 'SETAR',
                    ),
                    SizedBox(height: smallSpacing * 1),
                  ],
                ),
              ),
              ListTitlePrueba(
                topPadding: topPadding,
                smallSpacing: smallSpacing,
                letterSize: letterSize,
                title: 'Agua Potable',
                icon: Icons.broadcast_on_home,
                column: Column(
                  children: [
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'EPSAS',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'ELAPAS',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'SAGUAPAC',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'COSAALT',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'SEMAPA',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'COOPLAN',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'COSAPCO',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'COOPAPPI',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'SAJUBA',
                    ),
                  ],
                ),
              ),
              ListTitlePrueba(
                topPadding: topPadding,
                smallSpacing: smallSpacing,
                letterSize: letterSize,
                title: 'Gas Domiciliario',
                icon: Icons.broadcast_on_home,
                column: Column(
                  children: [
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'ypfb',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'emtagas',
                    ),
                  ],
                ),
              ),
              ListTitlePrueba(
                topPadding: topPadding,
                smallSpacing: smallSpacing,
                letterSize: letterSize,
                title: 'Telecomunicaciones',
                icon: Icons.broadcast_on_home,
                column: Column(
                  children: [
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'ENTEL',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'GoLochTel',
                    ),
                  ],
                ),
              ),
              ListTitlePrueba(
                topPadding: topPadding,
                smallSpacing: smallSpacing,
                letterSize: letterSize,
                title: 'Seguridad Social',
                icon: Icons.broadcast_on_home,
                column: Column(
                  children: [
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'ENTEL',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'GoLochTel',
                    ),
                  ],
                ),
              ),
              ListTitlePrueba(
                topPadding: topPadding,
                smallSpacing: smallSpacing,
                letterSize: letterSize,
                title: 'Univercidades',
                icon: Icons.broadcast_on_home,
                column: Column(
                  children: [
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'UMSA',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'UAGRM',
                    ),
                  ],
                ),
              ),
              ListTitlePrueba(
                topPadding: topPadding,
                smallSpacing: smallSpacing,
                letterSize: letterSize,
                title: 'Seguros',
                icon: Icons.broadcast_on_home,
                column: Column(
                  children: [
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'SOAT UNIVida',
                    ),
                  ],
                ),
              ),
              ListTitlePrueba(
                topPadding: topPadding,
                smallSpacing: smallSpacing,
                letterSize: letterSize,
                title: 'Empresas',
                icon: Icons.broadcast_on_home,
                column: Column(
                  children: [
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'Kantutani',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'PagosNET',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'TUPPERWARE',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'Yanbal',
                    ),
                  ],
                ),
              ),
              ListTitlePrueba(
                topPadding: topPadding,
                smallSpacing: smallSpacing,
                letterSize: letterSize,
                title: 'ProdemVida',
                icon: Icons.broadcast_on_home,
                column: Column(
                  children: [
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'Pólizas Propias',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'Pólizas de terceros',
                    ),
                  ],
                ),
              ),
              ListTitlePrueba(
                topPadding: topPadding,
                smallSpacing: smallSpacing,
                letterSize: letterSize,
                title: 'RUAT',
                icon: Icons.broadcast_on_home,
                column: Column(
                  children: [
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'Vehiculos',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'Inmuebles',
                    ),
                    Gesture(
                      onTap: () {},
                      topPadding: topPadding,
                      letterSize: letterSize,
                      small: smallSpacing,
                      icon: Icons.abc_outlined,
                      title: 'Infracciones',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
