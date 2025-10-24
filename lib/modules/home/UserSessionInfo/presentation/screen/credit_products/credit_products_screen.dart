import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/bank_guarantees/initial_charge_bank_guarantee/presentation/bloc/initial_charge_bank_guarantee_bloc.dart';
import 'package:app_prodem_v1/modules/credit_card/CreditCardDataQuery/presentation/bloc/credit_card_data_query_bloc.dart';
import 'package:app_prodem_v1/modules/credit_card/credit_card_data_for_recovery/presentation/screen/credit_car_data_for_recovery_screen.dart';
import 'package:app_prodem_v1/modules/credits/GetLoanFlowAnnuitiesDetailDataForCredit/presentation/bloc/get_loan_flow_annuities_detail_data_for_credit_bloc.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/screen/savings_products/savings_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditProductsScreen extends StatefulWidget {
  const CreditProductsScreen({super.key});

  @override
  State<CreditProductsScreen> createState() => _CreditProductsScreenState();
}

class _CreditProductsScreenState extends State<CreditProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<
                GetLoanFlowAnnuitiesDetailDataForCreditBloc
              >(),
        ),
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<CreditCardDataQueryBloc>(),
        ),
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<InitialChargeBankGuaranteeBloc>(),
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
                      title: 'Créditos',
                      icon: Icons.broadcast_on_home,
                      column: Column(
                        children: [
                          Gesture(
                            onTap: () {
                              InjectorContainer.getIt<AppRouter>().push(
                                LoanFlowAnnuitiesDetailDataForCreditRoute(
                                  sessionBloc: sessionBloc,
                                  bloc: newContext
                                      .read<
                                        GetLoanFlowAnnuitiesDetailDataForCreditBloc
                                      >(),
                                ),
                              );
                            },
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.abc_outlined,
                            title: 'Consulta de Créditos',
                          ),
                          SizedBox(height: smallSpacing * 1),
                          Gesture(
                            onTap: () {
                              InjectorContainer.getIt<AppRouter>().push(
                                LoanFlowGetCreditDetailDataForRecoveryRoute(
                                  sessionBloc: sessionBloc,
                                ),
                              );
                            },
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.abc_outlined,
                            title: 'Pago de Crédito',
                          ),
                          SizedBox(height: smallSpacing * 1),
                          Gesture(
                            onTap: () {
                              InjectorContainer.getIt<AppRouter>().push(
                                LoanFlowGetCreditDetailDataForRecoveryByCodeRoute(
                                  sessionBloc: sessionBloc,
                                ),
                              );
                            },
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.abc_outlined,
                            title: 'Pago de Crédito de Terceros',
                          ),
                          SizedBox(height: smallSpacing * 1),
                        ],
                      ),
                    ),
                    ListTitlePrueba(
                      topPadding: topPadding,
                      smallSpacing: smallSpacing,
                      letterSize: letterSize,
                      title: 'Targetas de crédito',
                      icon: Icons.broadcast_on_home,
                      column: Column(
                        children: [
                          Gesture(
                            onTap: () {
                              InjectorContainer.getIt<AppRouter>().push(
                                CreditCardDataQueryRoute(
                                  bloc: newContext
                                      .read<CreditCardDataQueryBloc>(),
                                  sessionBloc: sessionBloc,
                                ),
                              );
                            },
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.abc_outlined,
                            title: 'Consulta de Targeta de crédito',
                          ),
                          SizedBox(height: smallSpacing * 1),
                          Gesture(
                            onTap: () {
                              InjectorContainer.getIt<AppRouter>().push(
                                CreditCardDataForRecoveryRoute(
                                  sessionBloc: sessionBloc,
                                  creditType: CreditType.ownAccounts,
                                ),
                              );
                            },
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.abc_outlined,
                            title: 'Pago de Targeta de crédito',
                          ),
                          SizedBox(height: smallSpacing * 1),
                          Gesture(
                            onTap: () {
                              InjectorContainer.getIt<AppRouter>().push(
                                CreditCardDataForRecoveryRoute(
                                  sessionBloc: sessionBloc,
                                  creditType: CreditType.thirdParty,
                                ),
                              );
                            },
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.abc_outlined,
                            title: 'Pago de targeta de crédito de terceros',
                          ),
                          SizedBox(height: smallSpacing * 1),
                        ],
                      ),
                    ),
                    ListTitlePrueba(
                      topPadding: topPadding,
                      smallSpacing: smallSpacing,
                      letterSize: letterSize,
                      title: 'finanzas Bancarias',
                      icon: Icons.broadcast_on_home,
                      column: Column(
                        children: [
                          BlocBuilder<
                            InitialChargeBankGuaranteeBloc,
                            InitialChargeBankGuaranteeState
                          >(
                            builder: (context, state) {
                              if (state is InitialChargeBankGuaranteeSuccess) {
                                InjectorContainer.getIt<AppRouter>().push(
                                  InitialChargeBankGuaranteRoute(
                                    bloc: newContext
                                        .read<InitialChargeBankGuaranteeBloc>(),
                                    sessionBloc: sessionBloc,
                                  ),
                                );
                              }
                              return Gesture(
                                onTap: () {
                                  context
                                      .read<InitialChargeBankGuaranteeBloc>()
                                      .add(InitialChargeBankGuarEvent());
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'Solicitud Fianzas Bancarias',
                              );
                            },
                          ),
                          SizedBox(height: smallSpacing * 1),
                          Gesture(
                            onTap: () {
                              InjectorContainer.getIt<AppRouter>().push(
                                WebBankGuaranteeSoliRoute(filterType: '9537'),
                              );
                            },
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.abc_outlined,
                            title: 'Detalle fianzas Bancarias',
                          ),
                          SizedBox(height: smallSpacing * 1),
                          Gesture(
                            onTap: () {
                              InjectorContainer.getIt<AppRouter>().push(
                                WebBankGuaranteeSoliRoute(filterType: '9538'),
                              );
                            },
                            topPadding: topPadding,
                            letterSize: letterSize,
                            small: smallSpacing,
                            icon: Icons.abc_outlined,
                            title: 'Fianzas Bancarias Aprobadas',
                          ),
                          SizedBox(height: smallSpacing * 1),
                        ],
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
}
/**Padding(
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
          ); */