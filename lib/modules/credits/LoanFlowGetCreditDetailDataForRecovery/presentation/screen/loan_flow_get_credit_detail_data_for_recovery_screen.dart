import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/presentation/bloc/bloc/loan_flow_get_credit_detail_data_for_recovery_bloc.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoanFlowGetCreditDetailDataForRecoveryScreen extends StatefulWidget{
  final SessionInfoBloc sessionBloc;
  const LoanFlowGetCreditDetailDataForRecoveryScreen({
    super.key,
    required this.sessionBloc,
  });

  @override
  State<LoanFlowGetCreditDetailDataForRecoveryScreen> createState() =>
      _LoanFlowGetCreditDetailDataForRecoveryScreenState();
}



class _LoanFlowGetCreditDetailDataForRecoveryScreenState
  extends State<LoanFlowGetCreditDetailDataForRecoveryScreen> {
  String? _selectedOperationCode;
  String? _selectedLoanId;

  String? _selectedAccount;
  String? _selectedAccountId;

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
                LoanFlowGetCreditDetailDataForRecoveryBloc
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
              'Pago de Crédito',
              style: AppTextStyles.mainStyleWhite18Bold(context),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(topPadding * 0.05),
            child: Column(
              children: [
                Text(
                  'PAGO DE CRÉDITO',
                  style: AppTextStyles.mainStyleGreen18Bold(context),
                ),
                SizedBox(height: smallSpacing * 0.5),


                /// LISTA DE CUENTAS (Combo)
                BlocConsumer<SessionInfoBloc, SessionInfoState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is SessionInfoSuccess) {
                      final listAccounts =
                          state.userInfoResponseEnttity.listCodeSavingsAccount;

                      return Card(
                        elevation: smallSpacing * 0.5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.05,
                            vertical: smallSpacing * 0.5,
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            hint: const Text("Seleccione una cuenta de la lista:"),
                            value: _selectedAccount,
                            items: listAccounts.map((credit) {
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
                                _selectedAccount = newValue;

                                /// Guardamos el id del crédito seleccionado
                                final selectedCredit = listAccounts.firstWhere(
                                  (c) => c.operationCode == newValue,
                                );
                                _selectedAccountId = selectedCredit
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
                            hint: const Text("Seleccione el crédito que desea cancelar:"),
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
                SizedBox(
                  width: screenSize.width * 0.4,
                  child: Card(
                    elevation: smallSpacing * 0.5,
                    child: Butoon1(
                      onTap: () {

                        final idAccount = _selectedAccountId ?? "";
                        if (idAccount.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Debe seleccionar una cuenta.",
                              ),
                            ),
                          );
                          return;
                        }

                        final idLoan = _selectedLoanId ?? "";
                        if (idLoan.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Debe seleccionar un crédito primero.",
                              ),
                            ),
                          );
                          return;
                        }

                        context
                            .read<LoanFlowGetCreditDetailDataForRecoveryBloc>()
                            .add(
                              LoanFlowGetCredDetDatForRecoveryEvent(
                                idLoanCredit: idLoan,
                                idSavingAccount : idAccount
                              ),
                            );
                      },
                      lblTextField: 'CONSULTAR',
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}