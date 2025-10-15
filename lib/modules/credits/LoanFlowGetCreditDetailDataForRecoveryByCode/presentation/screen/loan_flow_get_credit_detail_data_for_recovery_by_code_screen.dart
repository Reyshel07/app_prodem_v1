import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecoveryByCode/presentation/bloc/bloc/loan_flow_get_credit_detail_data_for_recovery_by_code_bloc.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecoveryByCode/presentation/bloc/bloc/loan_flow_payment_credit_third_bloc.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/create_pr_key_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/get_pr_key_by_id_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class LoanFlowGetCreditDetailDataForRecoveryByCodeScreen
    extends StatefulWidget {
  final SessionInfoBloc sessionBloc;
  const LoanFlowGetCreditDetailDataForRecoveryByCodeScreen({
    super.key,
    required this.sessionBloc,
  });

  @override
  State<LoanFlowGetCreditDetailDataForRecoveryByCodeScreen> createState() =>
      _LoanFlowGetCreditDetailDataForRecoveryByCodeScreenState();
}

class _LoanFlowGetCreditDetailDataForRecoveryByCodeScreenState
    extends State<LoanFlowGetCreditDetailDataForRecoveryByCodeScreen> {
  String? _codeOperationCode;
  // String? _selectedLoanId;
  final TextEditingController _textFieldController = TextEditingController();

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
                LoanFlowGetCreditDetailDataForRecoveryByCodeBloc
              >(),
        ),
        BlocProvider.value(value: widget.sessionBloc),

        BlocProvider(
          create: (context) => InjectorContainer.getIt<CreatePrKeyBloc>(),
        ),

        BlocProvider(
          create: (contex) => InjectorContainer.getIt<GetPrKeyByIdBloc>(),
        ),

        BlocProvider(
          create: (contex) =>
              InjectorContainer.getIt<LoanFlowPaymentCreditThirdBloc>(),
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
                  LoanFlowGetCreditDetailDataForRecoveryByCodeBloc,
                  LoanFlowGetCreditDetailDataForRecoveryByCodeState
                >(
                  listener: (context, state) {
                    if (state
                        is LoanFlowGetCreditDetailDataForRecoveryByCodeError) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  builder: (context, state) {
                    // Loading -> indicador
                    if (state
                        is LoanFlowGetCreditDetailDataForRecoveryByCodeLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    // Success -> mostrar datos recuperados (ocultar UI inicial)
                    if (state
                        is LoanFlowGetCreditDetailDataForRecoveryByCodeSuccess) {
                      final entity = state
                          .loanFlowGetCreditDetailDataForRecoveryByCodeEntity;

                      return SingleChildScrollView(
                        child: Column(
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
                                                        LoanFlowPaymentCreditThirdBloc,
                                                        LoanFlowPaymentCreditThirdState
                                                      >(
                                                        listener: (context, state) {
                                                          if (state
                                                              is LoanFlowPaymentCreditThirdSuccess) {
                                                            InjectorContainer.getIt<
                                                                  AppRouter
                                                                >()
                                                                .push(
                                                                  SavingAccountTransMobileEndRoute(
                                                                    response: state
                                                                        .savingsAccountTransferMobileResponseEntity
                                                                        .data,
                                                                  ),
                                                                );
                                                          }
                                                          if (state
                                                              is LoanFlowPaymentCreditThirdError) {
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
                                                                    LoanFlowPaymentCreditThirdBloc
                                                                  >()
                                                                  .add(
                                                                    LoanFlowPaymentCreditThirdE(
                                                                      idLoanCredit:
                                                                          entity
                                                                              .idLoanCredit,
                                                                      debitAmount:
                                                                          entity
                                                                              .totalToDebit,
                                                                      amountToPay:
                                                                          entity
                                                                              .totalAmountToPay,
                                                                      taxAmount:
                                                                          entity
                                                                              .totalTax,
                                                                      idLoanCurrency:
                                                                          entity
                                                                              .idLoanCurrency,
                                                                      withInsuranceReturn:
                                                                          entity
                                                                              .withInsuranceReturn,
                                                                      idSavingAccount:
                                                                          _selectedAccountId!
                                                                              .toInt(),
                                                                      loanCreditCode:
                                                                          entity
                                                                              .loanCreditCode,
                                                                      isOwnCredit:
                                                                          false,
                                                                      idSMSOperation: createState
                                                                          .createProdemKeyResponseEntity!
                                                                          .data
                                                                          .toString(),
                                                                      prodemKeyCode:
                                                                          getState
                                                                              .getProdemKeyByIdResponseEntity
                                                                              ?.data ??
                                                                          '',
                                                                    ),
                                                                  );
                                                            },
                                                            lblTextField:
                                                                state
                                                                    is LoanFlowPaymentCreditThirdLoading
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

                          // inpout crédito
                          _buildInputCreditCode(screenSize, smallSpacing),

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

                                  context
                                      .read<
                                        LoanFlowGetCreditDetailDataForRecoveryByCodeBloc
                                      >()
                                      .add(
                                        LoanFlowGetCreditDetailDataForRecoveryByCodeE(
                                          loanCreditCode:
                                              _codeOperationCode ?? "",
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

  Widget _buildInputCreditCode(Size screenSize, double smallSpacing) {
    return SizedBox(
      child: Card(
        elevation: smallSpacing * 0.5,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.green),
            borderRadius: const BorderRadius.all(Radius.circular(11)),
          ),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: _textFieldController,
            textAlign: TextAlign.start,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
            ),
            //usar variable _codeOperationCode
            onChanged: (value) {
              // Elimina cualquier guion previo
              String digits = value.replaceAll('-', '');

              // Limita el largo total (3+1+1+5+1 = 11 caracteres)
              if (digits.length > 11) digits = digits.substring(0, 11);

              // Aplica formato progresivamente
              String formatted = '';
              for (int i = 0; i < digits.length; i++) {
                formatted += digits[i];
                if (i == 2 || i == 3 || i == 4 || i == 9) {
                  if (i != digits.length - 1) formatted += '-';
                }
              }

              // Actualiza el texto sin causar loop
              _textFieldController.value = TextEditingValue(
                text: formatted,
                selection: TextSelection.collapsed(offset: formatted.length),
              );

              setState(() {
                _codeOperationCode = formatted;
              });
            },

            //
            decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
              hintText: 'Código de Crédito',
              hintStyle: AppTextStyles.mainStyleGreen14(context),
              filled: false,
              isDense: false,
              contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            ),
          ),
        ),
      ),
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
