import 'package:app_prodem_v1/config/router/app_router.dart';
import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/home/GetAccountBalances/presentation/bloc/account_balance_bloc.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/bloc.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../transfer_between_accounts/GetSavingAccountData/presentation/bloc/bloc.dart';
import '../../../../SavingsAccountExtractDataTransactionable/presentation/bloc/bloc.dart';

class SavingsProductsScreen extends StatefulWidget {
  const SavingsProductsScreen({super.key});

  @override
  State<SavingsProductsScreen> createState() => _SavingsProductsScreenState();
}

class _SavingsProductsScreenState extends State<SavingsProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InjectorContainer.getIt<AccountBalanceBloc>(),
        ),
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<SavingAccountExtracBloc>(),
        ),
        BlocProvider(
          create: (context) => InjectorContainer.getIt<SavingAccountDataBloc>(),
        ),
      ],
      child: Scaffold(
        body: Builder(
          builder: (newContext) {
            final sessionBloc = context.read<SessionInfoBloc>();
            return ListView(
              children: [
                Column(
                  children: [
                    ListTitlePrueba(
                      topPadding: topPadding,
                      smallSpacing: smallSpacing,
                      letterSize: letterSize,
                      title: 'Caja de Ahorro',
                      icon: Icons.savings,
                      column: Column(
                        children: [
                          Gesture(
                            onTap: () {},
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.compare_arrows,
                            title: 'Transacciones',
                          ),
                          Gesture(
                            onTap: () {
                              InjectorContainer.getIt<AppRouter>().push(
                                AccountInquiryRoute(
                                  bloc: newContext.read<AccountBalanceBloc>(),
                                  sessionBloc: sessionBloc,
                                ),
                              );
                            },
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.account_balance,
                            title: 'Consulta Cuenta',
                          ),
                          Gesture(
                            onTap: () {
                              InjectorContainer.getIt<AppRouter>().push(
                                SavingAccountExtractDataTranSacreen(
                                  bloc: newContext
                                      .read<SavingAccountExtracBloc>(),
                                  sessionBloc: sessionBloc,
                                ),
                              );
                            },
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.receipt_long,
                            title: 'Consulta de ultimos movimientos',
                          ),
                          Gesture(
                            onTap: () {
                              InjectorContainer.getIt<AppRouter>().push(
                                SavingAccountDataRoute(
                                  bloc: newContext
                                      .read<SavingAccountDataBloc>(),
                                  sessionBloc: sessionBloc,
                                ),
                              );
                            },
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.compare_arrows,
                            title: 'Transferencia entre cuentas propias',
                          ),
                          Gesture(
                            onTap: () {},
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.send,
                            title: 'Transferencia a cuenta de terceros',
                          ),
                          Gesture(
                            onTap: () {},
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.compare_arrows,
                            title: 'Transferencia a otros bancos',
                          ),
                          Gesture(
                            onTap: () {},
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.confirmation_num,
                            title: 'Tickets de Campaña',
                          ),
                          SizedBox(height: smallSpacing * 1),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ListTitlePrueba(
                        topPadding: topPadding,
                        smallSpacing: smallSpacing,
                        letterSize: letterSize,
                        title: 'Deposito de otras entidades',
                        icon: Icons.broadcast_on_home,
                        column: Column(),
                      ),
                    ),
                    ListTitlePrueba(
                      topPadding: topPadding,
                      smallSpacing: smallSpacing,
                      letterSize: letterSize,
                      title: 'Giro relampago',
                      icon: Icons.broadcast_on_home,
                      column: Column(
                        children: [
                          Gesture(
                            onTap: () {},
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.abc_outlined,
                            title: 'Solicitud de Giro Relampago',
                          ),
                          SizedBox(height: smallSpacing * 1),
                          Gesture(
                            onTap: () {},
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.abc_outlined,
                            title: 'Detalles de solicitudes de Giro Relampago',
                          ),
                          SizedBox(height: smallSpacing * 1),
                        ],
                      ),
                    ),
                    ListTitlePrueba(
                      topPadding: topPadding,
                      smallSpacing: smallSpacing,
                      letterSize: letterSize,
                      title: 'QR Prodem Cobro/Pago',
                      icon: Icons.broadcast_on_home,
                      column: Column(
                        children: [
                          Gesture(
                            onTap: () {},
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.abc_outlined,
                            title: 'Cobro QR Prodem',
                          ),
                          SizedBox(height: smallSpacing * 1),
                          Gesture(
                            onTap: () {},
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.abc_outlined,
                            title: 'Pago QR Prodem',
                          ),
                          SizedBox(height: smallSpacing * 1),
                          Gesture(
                            onTap: () {},
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.abc_outlined,
                            title: 'Movimientos',
                          ),
                          SizedBox(height: smallSpacing * 1),
                        ],
                      ),
                    ),
                    ListTitlePrueba(
                      topPadding: topPadding,
                      smallSpacing: smallSpacing,
                      letterSize: letterSize,
                      title: 'DPF',
                      icon: Icons.broadcast_on_home,
                      column: Column(
                        children: [
                          Gesture(
                            onTap: () {},
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.abc_outlined,
                            title: 'Solicitud DPF Empleado Prodem',
                          ),
                          SizedBox(height: smallSpacing * 1),
                          Gesture(
                            onTap: () {},
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.abc_outlined,
                            title: 'Solicitud DPF en linea',
                          ),
                          SizedBox(height: smallSpacing * 1),
                          Gesture(
                            onTap: () {},
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.abc_outlined,
                            title: 'Bandeja de solicitudes ',
                          ),
                          SizedBox(height: smallSpacing * 1),
                          Gesture(
                            onTap: () {},
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.abc_outlined,
                            title: 'Administracion DPF',
                          ),
                          SizedBox(height: smallSpacing * 1),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ListTitlePrueba(
                        topPadding: topPadding,
                        smallSpacing: smallSpacing,
                        letterSize: letterSize,
                        title: 'Retiro qr ATM',
                        icon: Icons.broadcast_on_home,
                        column: Column(),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  /*Padding(
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
      ),*/
}

class ListTitlePrueba extends StatelessWidget {
  const ListTitlePrueba({
    super.key,
    required this.topPadding,
    required this.smallSpacing,
    required this.letterSize,
    required this.title,
    required this.icon,
    required this.column,
  });

  final double topPadding;
  final double smallSpacing;
  final double letterSize;
  final String title;
  final IconData icon;
  final Column column;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: topPadding * 0.05,
        vertical: topPadding * 0.01,
      ),
      child: Card(
        elevation: smallSpacing * 0.5,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.green),
            borderRadius: const BorderRadius.all(Radius.circular(13)),
          ),
          child: ExpansionTile(
            shape: const Border.symmetric(horizontal: BorderSide.none),
            iconColor: Theme.of(context).colorScheme.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: AppTextStyles.mainStyleGreen16Bold(context)),
              ],
            ),
            trailing: Icon(icon, color: Theme.of(context).colorScheme.green),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: smallSpacing * 1),
                child: column,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Gesture extends StatelessWidget {
  const Gesture({
    super.key,
    required this.onTap,
    required this.topPadding,
    required this.letterSize,
    required this.icon,
    required this.title,
    required this.small,
  });

  final VoidCallback onTap;
  final double topPadding;
  final double letterSize;
  final double small;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(topPadding * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: small * 15,
              child: Text(
                title,
                style: AppTextStyles.mainStyleGreen14(context),
                overflow: TextOverflow.clip,
              ),
            ),
            Icon(icon, color: Theme.of(context).colorScheme.green),
          ],
        ),
      ),
    );
  }
}
