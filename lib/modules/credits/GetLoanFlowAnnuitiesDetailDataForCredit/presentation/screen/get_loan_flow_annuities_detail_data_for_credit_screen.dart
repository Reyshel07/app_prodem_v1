import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/credits/GetLoanFlowAnnuitiesDetailDataForCredit/presentation/bloc/get_loan_flow_annuities_detail_data_for_credit_bloc.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoanFlowAnnuitiesDetailDataForCreditScreen extends StatefulWidget {
  final SessionInfoBloc sessionBloc;
  const LoanFlowAnnuitiesDetailDataForCreditScreen({
    super.key,
    required this.sessionBloc,
  });

  @override
  State<LoanFlowAnnuitiesDetailDataForCreditScreen> createState() =>
      _LoanFlowAnnuitiesDetailDataForCreditScreenState();
}

class _LoanFlowAnnuitiesDetailDataForCreditScreenState
    extends State<LoanFlowAnnuitiesDetailDataForCreditScreen> {
  String? _selectedOperationCode;
  String? _selectedLoanId;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<
                GetLoanFlowAnnuitiesDetailDataForCreditBloc
              >(),
        ),
        BlocProvider.value(value: widget.sessionBloc),
      ],
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            foregroundColor: Theme.of(context).colorScheme.white,
            backgroundColor: Theme.of(context).colorScheme.green,
            title: Text(
              'Consulta de Créditos',
              style: AppTextStyles.mainStyleWhite18Bold(context),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(topPadding * 0.05),
            child: Column(
              children: [
                Text(
                  'CONSULTA DE CRÉDITOS',
                  style: AppTextStyles.mainStyleGreen18Bold(context),
                ),
                SizedBox(height: smallSpacing * 0.5),

                /// LISTA DE CRÉDITOS (Combo)
                BlocConsumer<SessionInfoBloc, SessionInfoState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is SessionInfoSuccess) {
                      final listCredits =
                          state.userInfoResponseEnttity.listCodeLoanFlowCredit;

                      return Card(
                        elevation: smallSpacing * 0.5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.05,
                            vertical: smallSpacing * 0.5,
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            hint: const Text("Seleccione un crédito"),
                            value: _selectedOperationCode,
                            items: listCredits.map((credit) {
                              return DropdownMenuItem<String>(
                                value: credit.operationCode.toString(),
                                child: Text(
                                  credit.operationCode.toString(),
                                  style: AppTextStyles.mainStyleGreen14Bold(
                                    context,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedOperationCode = newValue;

                                /// Guardamos el id del crédito seleccionado
                                final selectedCredit = listCredits.firstWhere(
                                  (c) => c.operationCode == newValue,
                                );
                                _selectedLoanId = selectedCredit
                                    .idOperationEntity
                                    .toString();
                              });
                            },
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),

                SizedBox(height: smallSpacing * 1.5),

                /// BOTÓN CONSULTAR
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

                    context
                        .read<GetLoanFlowAnnuitiesDetailDataForCreditBloc>()
                        .add(
                          GetLoanFlowAnnuDetDataForCreditEvent(
                            idLoanCredit: idLoan,
                          ),
                        );
                  },
                  lblTextField: 'CONSULTAR',
                ),
                BlocConsumer<
                  GetLoanFlowAnnuitiesDetailDataForCreditBloc,
                  GetLoanFlowAnnuitiesDetailDataForCreditState
                >(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state
                        is GetLoanFlowAnnuitiesDetailDataForCreditSuccess) {
                      final res =
                          state.getLoanFlowAnnuitiesDetailDataForCreditEntity;
                      return Column(
                        children: [
                          SizedBox(height: smallSpacing * 0.5),

                          Text(
                            "DETALLE DEL CRÉDITO",
                            style: AppTextStyles.mainStyleGreen18Bold(context),
                          ),

                          SizedBox(height: smallSpacing * 0.5),

                          Row(
                            children: [
                              Text(
                                "Código de Crédito:\n"
                                "Monto:\n"
                                "Días de Atraso:",
                                style: AppTextStyles.mainStyleGreen14Bold(
                                  context,
                                ),
                              ),
                              SizedBox(width: smallSpacing * 0.5),
                              Text(
                                "${res.loanCreditCode}\n"
                                "${res.creditAmount}\n"
                                "${res.delayDays}",
                              ),
                            ],
                          ),
                          SizedBox(height: smallSpacing * 0.5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Nro. Cuota",
                                style: AppTextStyles.mainStyleGreen14Bold(
                                  context,
                                ),
                              ),
                              Text(
                                "Fecha Vencimiento",
                                style: AppTextStyles.mainStyleGreen14Bold(
                                  context,
                                ),
                              ),
                              Text(
                                "Monto Cuota",
                                style: AppTextStyles.mainStyleGreen14Bold(
                                  context,
                                ),
                              ),
                              Text(
                                "Pagado",
                                style: AppTextStyles.mainStyleGreen14Bold(
                                  context,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          SizedBox(
                            height: screenSize.height * 0.5,
                            child: ListView.builder(
                              itemCount: res.colAnnuitiesDetail.length,
                              itemBuilder: (context, index) {
                                final data = res.colAnnuitiesDetail[index];
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(data.annuityNumber),
                                        Text(data.annuityEndDate.toString()),
                                        Text(data.annuityBalance.toString()),
                                        Text(data.isPaid == true ? "SI" : "NO"),
                                      ],
                                    ),
                                    Divider(),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }
                    return CircularProgressIndicator();
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
