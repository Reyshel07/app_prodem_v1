import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/modules/credit_card/CreditCardDataQuery/presentation/bloc/credit_card_data_query_bloc.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/drop.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:app_prodem_v1/utils/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CreditCardDataQueryScreen extends StatefulWidget {
  final SessionInfoBloc sessionBloc;
  final CreditCardDataQueryBloc bloc;
  const CreditCardDataQueryScreen({
    super.key,
    required this.bloc,
    required this.sessionBloc,
  });

  @override
  State<CreditCardDataQueryScreen> createState() =>
      _CreditCardDataQueryScreenState();
}

class _CreditCardDataQueryScreenState extends State<CreditCardDataQueryScreen> {
  String? _selectedOperationCode;
  String? _selectedLoanId;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.bloc),
        BlocProvider.value(value: widget.sessionBloc),
      ],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Consulta de Targetas de Créditos',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(topPadding * 0.05),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'CONSULTA DE CRÉDITOS',
                  style: AppTextStyles.mainStyleGreen18Bold(context),
                ),
                SizedBox(height: smallSpacing * 0.5),
                CreditCardDropdown(
                  selectedOperationCode: _selectedOperationCode,
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  onChanged: (data) {
                    setState(() {
                      _selectedOperationCode = data.operationCode;
                      _selectedLoanId = data.idOperationEntity;
                    });
                  },
                ),

                SizedBox(height: smallSpacing * 1.5),
                Butoon1(
                  onTap: () {
                    final idLoan = _selectedLoanId ?? "";
                    if (idLoan.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Debe seleccionar un crédito primero."),
                        ),
                      );
                      return;
                    }
                    widget.bloc.add(
                      CreditCardDataQueryE(
                        creditCardNumber: _selectedOperationCode,
                      ),
                    );
                  },
                  lblTextField: 'CONSULTAR',
                ),
                BlocBuilder<CreditCardDataQueryBloc, CreditCardDataQueryState>(
                  builder: (context, state) {
                    if (state is CreditCardDataQuerySuccess) {
                      final res = state.creditCardDataQueryEntity;
                      return Column(
                        children: [
                          SizedBox(height: smallSpacing * 0.5),

                          Text(
                            "DETALLE DE TARJETA DE CRÉDITO",
                            style: AppTextStyles.mainStyleGreen18Bold(context),
                          ),
                          SizedBox(height: smallSpacing * 0.5),
                          Row(
                            children: [
                              Text(
                                "Fecha:\n"
                                "Cuenta de tarjeta de crédito:\n"
                                "Monto límite:\n"
                                "Saldo deudor:\n"
                                "Saldo menos intereses:\n"
                                "Saldo capital calculado:\n"
                                "Monto minimo:",
                                style: AppTextStyles.mainStyleGreen14Bold(
                                  context,
                                ),
                              ),
                              SizedBox(width: smallSpacing * 0.5),
                              Text(
                                "${DateFormatter.formatDateTime(res.processDate)}\n"
                                "${res.balanceAvailable}\n"
                                "${res.creditLineAmount}\n"
                                "${res.balanceAmount}\n"
                                "${res.principalBalance}\n"
                                "${res.minimumPayment}\n"
                                "${res.principalBalanceAtc}",
                              ),
                            ],
                          ),
                          SizedBox(height: smallSpacing * 0.5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Fecha transacción",
                                style: AppTextStyles.mainStyleGreen10Bold(
                                  context,
                                ),
                              ),
                              Text(
                                "Operación",
                                style: AppTextStyles.mainStyleGreen10Bold(
                                  context,
                                ),
                              ),
                              Text(
                                "Tipo Operación",
                                style: AppTextStyles.mainStyleGreen10Bold(
                                  context,
                                ),
                              ),
                              Text(
                                "Monto",
                                style: AppTextStyles.mainStyleGreen10Bold(
                                  context,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: res.colMovementsDetails.length,
                            itemBuilder: (context, index) {
                              final data = res.colMovementsDetails[index];
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        DateFormatter.formatDateTime(
                                          data.transactionDate,
                                        ),
                                        style: AppTextStyles.mainStyleGreen10(
                                          context,
                                        ),
                                      ),
                                      Text(
                                        data.operationDescription,
                                        style: AppTextStyles.mainStyleGreen10(
                                          context,
                                        ),
                                      ),
                                      Text(
                                        data.operationKind,
                                        style: AppTextStyles.mainStyleGreen10(
                                          context,
                                        ),
                                      ),
                                      Text(
                                        data.transactionAmount.toString(),
                                        style: AppTextStyles.mainStyleGreen10(
                                          context,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    }
                    if (state is CreditCardDataQueryLoading) {
                      return CircularProgressIndicator();
                    }
                    return SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
