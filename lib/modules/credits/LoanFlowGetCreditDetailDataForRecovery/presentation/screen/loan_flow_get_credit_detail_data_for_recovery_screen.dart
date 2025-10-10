import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/presentation/bloc/bloc/loan_flow_get_credit_detail_data_for_recovery_bloc.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/presentation/bloc/bloc/loan_flow_payment_credit_bloc.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/create_pr_key_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/get_pr_key_by_id_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class LoanFlowGetCreditDetailDataForRecoveryScreen extends StatefulWidget {
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
  String? _selectedAccountMoneyId;

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

        BlocProvider(
          create: (context) => InjectorContainer.getIt<CreatePrKeyBloc>(),
        ),

        BlocProvider(
          create: (contex) => InjectorContainer.getIt<GetPrKeyByIdBloc>(),
        ),
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
            child:
                BlocConsumer<
                  LoanFlowGetCreditDetailDataForRecoveryBloc,
                  LoanFlowGetCreditDetailDataForRecoveryState
                >(
                  listener: (context, state) {
                    if (state is LoanFlowGetCreditDetailDataForRecoveryError) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  builder: (context, state) {
                    // Loading -> indicador
                    if (state
                        is LoanFlowGetCreditDetailDataForRecoveryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    // Success -> mostrar datos recuperados (ocultamos UI inicial)
                    if (state
                        is LoanFlowGetCreditDetailDataForRecoverySuccess) {
                      final entity =
                          state.loanFlowGetCreditDetailDataForRecoveryEntity;

                      return SingleChildScrollView(
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'DETALLE PAGO DE CRÉDITO',
                              style: AppTextStyles.mainStyleGreen18Bold(
                                context,
                              ),
                            ),
                            SizedBox(height: smallSpacing),
                            Card(
                              elevation: smallSpacing * 0.5,
                              child: Padding(
                                padding: EdgeInsets.all(smallSpacing),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildLabelValueRow(
                                      'Cuenta a DEBITAR:',
                                      _selectedAccount ?? '',
                                    ),
                                    SizedBox(height: smallSpacing * 0.5),
                                    _buildLabelValueRow(
                                      'Saldo Disponible:',
                                      entity.savingBalance.toString() ?? '',
                                    ),
                                    SizedBox(height: smallSpacing * 0.5),
                                    _buildLabelValueRow(
                                      'Cliente:',
                                      entity.customerName ?? '',
                                    ),
                                    SizedBox(height: smallSpacing * 0.5),
                                    _buildLabelValueRow(
                                      'Doc. Identidad:',
                                      entity.identityCard ?? '',
                                    ),
                                    SizedBox(height: smallSpacing * 0.5),
                                    _buildLabelValueRow(
                                      'Cod. del CRÉDITO:',
                                      entity.loanCreditCode ?? '',
                                    ),
                                    SizedBox(height: smallSpacing * 0.5),
                                    _buildLabelValueRow(
                                      'Monto de la cuota:',
                                      '${entity.totalAmountToPay - entity.voluntarySaving - entity.totalTax} ${entity.loanCurrency ?? ''}',
                                    ),

                                    SizedBox(height: smallSpacing * 0.5),
                                    _buildLabelValueRow(
                                      'Total Impuestos:',
                                      entity.totalTax.toString() ?? '',
                                    ),
                                    SizedBox(height: smallSpacing * 0.5),
                                    _buildLabelValueRow(
                                      'Ahorro Voluntario:',
                                      entity.voluntarySaving.toString() ?? '',
                                    ),
                                    SizedBox(height: smallSpacing * 0.5),
                                    _buildLabelValueRow(
                                      'Monto de la cuota:',
                                      entity.totalAmountToPay.toString() ?? '',
                                    ),
                                    SizedBox(height: smallSpacing * 0.5),
                                    _buildLabelValueRow(
                                      'Fecha de Vencimiento:',
                                      entity.currentAnnuityEnddingDate
                                              .toString() ??
                                          '',
                                    ),
                                    SizedBox(height: smallSpacing * 0.5),
                                    _buildLabelValueRow(
                                      'Existe cambio de moneda:',
                                      (_selectedAccountMoneyId.toInt() !=
                                              entity.idLoanCurrency)
                                          ? 'SI'
                                          : 'NO',
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: smallSpacing * 1.5),

                            //  BLOQUE DE BOTONES CODIGO PRODEM
                            BlocConsumer<CreatePrKeyBloc, CreatePrKeyState>(
                              listener: (context, createState) {
                                if (createState is CreatePrKeySuccess) {
                                  context.read<GetPrKeyByIdBloc>().add(
                                    GetPrKeyEvent(
                                      idSmsOperation: createState
                                          .createProdemKeyResponseEntity!
                                          .data
                                          .toString(),
                                    ),
                                  );
                                }
                              },
                              builder: (context, createState) {
                                return BlocBuilder<
                                  GetPrKeyByIdBloc,
                                  GetPrKeyByIdState
                                >(
                                  builder: (context, getState) {
                                    return Column(
                                      children: [
                                        // 🔹 Texto dinámico según el estado de GetKey
                                        if (getState is GetPrKeyByIdSuccess)
                                          Text(
                                            getState
                                                    .getProdemKeyByIdResponseEntity
                                                    ?.data ??
                                                '---',
                                            style:
                                                AppTextStyles.mainStyleGreen18Bold(
                                                  context,
                                                ),
                                          )
                                        else
                                          Text(
                                            'CÓDIGO PRODEM',
                                            style:
                                                AppTextStyles.mainStyleGreen18Bold(
                                                  context,
                                                ),
                                          ),

                                        SizedBox(height: smallSpacing * 0.5),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (createState
                                                is CreatePrKeyLoading)
                                              const CircularProgressIndicator(),

                                            if (createState
                                                    is! CreatePrKeySuccess &&
                                                createState
                                                    is! CreatePrKeyLoading)
                                              SizedBox(
                                                width: screenSize.width * 0.4,
                                                child: Card(
                                                  elevation: smallSpacing * 0.5,
                                                  child: Butoon1(
                                                    onTap: () {
                                                      context
                                                          .read<
                                                            CreatePrKeyBloc
                                                          >()
                                                          .add(
                                                            CreatePrKeyEvent1(),
                                                          );
                                                    },
                                                    lblTextField:
                                                        'OBTENER CÓDIGO',
                                                  ),
                                                ),
                                              ),

                                            if (createState
                                                    is CreatePrKeySuccess &&
                                                getState is GetPrKeyByIdSuccess)
                                              SizedBox(
                                                width: screenSize.width * 0.3,
                                                child: Card(
                                                  elevation: smallSpacing * 0.5,
                                                  child:
                                                      BlocConsumer<
                                                        LoanFlowPaymentCreditBloc,
                                                        LoanFlowPaymentCreditState
                                                      >(
                                                        listener: (context, state) {
                                                          if (state
                                                              is LoanFlowPaymentCreditSuccess) {
                                                            InjectorContainer.getIt<
                                                                  AppRouter
                                                                >()
                                                                .push(
                                                                  SavingAccountTransMobileEndRoute(
                                                                    response:
                                                                        state.savingsAccountTransferMobileResponseEntity,
                                                                  ),
                                                                );
                                                          }
                                                          if (state
                                                              is LoanFlowPaymentCreditError) {
                                                            ScaffoldMessenger.of(
                                                              context,
                                                            ).showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  state.message,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                        },
                                                        builder: (context, state) {
                                                          return Butoon1(
                                                            onTap: () {
                                                              context
                                                                  .read<
                                                                    LoanFlowPaymentCreditBloc
                                                                  >()
                                                                  .add(
                                                                    LoanFlowPaymentCreditE(
                                                                      idLoanCredit: entity.idLoanCredit,
                                                                      debitAmount: entity.totalToDebit,
                                                                      amountToPay: entity.totalAmountToPay,
                                                                      taxAmount: entity.totalTax,
                                                                      idLoanCurrency: entity.idLoanCurrency,
                                                                      withInsuranceReturn: entity.withInsuranceReturn,
                                                                      idSavingAccount: _selectedAccountId!.toInt(),
                                                                      loanCreditCode: entity.loanCreditCode,
                                                                      isOwnCredit: true,
                                                                      idSMSOperation: createState.createProdemKeyResponseEntity!.data.toString(),
                                                                      prodemKeyCode:getState.getProdemKeyByIdResponseEntity?.data ??'',
                                                                    ),
                                                                  );
                                                            },
                                                            lblTextField:
                                                                state
                                                                    is LoanFlowPaymentCreditLoading
                                                                ? 'Procesando...'
                                                                : 'CONFIRMAR',
                                                          );
                                                        },
                                                      ),
                                                ),
                                              ),

                                            SizedBox(
                                              width: screenSize.width * 0.3,
                                              child: Card(
                                                elevation: smallSpacing * 0.5,
                                                child: Butoon1(
                                                  onTap: () {},
                                                  lblTextField: 'CANCELAR',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    }

                    // Initial / Error (no success) -> mostramos UI inicial (titulo, combos y botón)
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'PAGO DE CRÉDITO',
                            style: AppTextStyles.mainStyleGreen18Bold(context),
                          ),
                          SizedBox(height: smallSpacing * 0.5),

                          // Dropdown de cuentas
                          _buildAccountsDropdown(screenSize, smallSpacing),

                          // Dropdown de créditos
                          _buildCreditsDropdown(screenSize, smallSpacing),

                          SizedBox(height: smallSpacing * 1.5),

                          // Botón consultar
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
                                      .read<
                                        LoanFlowGetCreditDetailDataForRecoveryBloc
                                      >()
                                      .add(
                                        LoanFlowGetCredDetDatForRecoveryEvent(
                                          idLoanCredit: idLoan,
                                          idSavingAccount: idAccount,
                                        ),
                                      );
                                },
                                lblTextField: 'CONSULTAR',
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountsDropdown(Size screenSize, double smallSpacing) {
    return BlocConsumer<SessionInfoBloc, SessionInfoState>(
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
                items: listAccounts.map((account) {
                  return DropdownMenuItem<String>(
                    value: account.operationCode.toString(),
                    child: Text(
                      '${account.operationCode} - ${account.availableAmount ?? 0} ${account.codMoney ?? 0}',
                      style: AppTextStyles.mainStyleGreen14Bold(context),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedAccount = newValue;

                    final selectedAccount = listAccounts.firstWhere(
                      (c) => c.operationCode == newValue,
                    );
                    _selectedAccountId = selectedAccount.idOperationEntity
                        .toString();
                    _selectedAccountMoneyId = selectedAccount.idMoney
                        .toString();
                  });
                },
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildCreditsDropdown(Size screenSize, double smallSpacing) {
    return BlocConsumer<SessionInfoBloc, SessionInfoState>(
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
                      style: AppTextStyles.mainStyleGreen14Bold(context),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedOperationCode = newValue;

                    final selectedCredit = listCredits.firstWhere(
                      (c) => c.operationCode == newValue,
                    );
                    _selectedLoanId = selectedCredit.idOperationEntity
                        .toString();
                  });
                },
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildLabelValueRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // separa label y valor
      children: [
        Text(label, style: AppTextStyles.mainStyleGreen14Bold(context)),
        Text(
          value,
          //style: AppTextStyles.mainStyleBlack14Regular(context),
        ),
      ],
    );
  }
}
