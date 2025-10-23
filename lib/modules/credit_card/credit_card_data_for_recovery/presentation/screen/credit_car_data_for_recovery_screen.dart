import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/credit_card/credit_card_data_for_recovery/presentation/bloc/credit_car_data_for_recovery_bloc.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/drop.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CreditType {
  ownAccounts, // pago de credito
  thirdParty, // pago de credito a terceros
}

@RoutePage()
class CreditCardDataForRecoveryScreen extends StatefulWidget {
  final SessionInfoBloc sessionBloc;
  final CreditType creditType;
  const CreditCardDataForRecoveryScreen({
    super.key,
    required this.sessionBloc,
    required this.creditType,
  });

  @override
  State<CreditCardDataForRecoveryScreen> createState() =>
      _CreditCardDataForRecoveryScreenState();
}

class _CreditCardDataForRecoveryScreenState
    extends State<CreditCardDataForRecoveryScreen> {
  final TextEditingController amountToSendController = TextEditingController(
    text: '117',
  );
  final TextEditingController codeMoneyController = TextEditingController(
    text: 'BS',
  );
  final TextEditingController accountCreditcardController =
      TextEditingController();
  String? _selectedAccount;
  String? _idSelectedAccount;
  String? _selectedOperationCode;
  String? _selectedLoanId;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;

    final isOwnAccounts = widget.creditType == CreditType.ownAccounts;

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.sessionBloc),
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<CreditCarDataForRecoveryBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Pago de Targeta de Crédito',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(topPadding * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isOwnAccounts
                    ? "PAGO DE TARGETA DE CRÉDITO"
                    : "PAGO DE TARGETA DE CRÉDITO DE TERCEROS",
                style: AppTextStyles.mainStyleGreen18Bold(context),
              ),
              Text(
                isOwnAccounts
                    ? "Seleccione un código de cuenta de ahorro de la lista:"
                    : "Seleccione un codigo de cuenta de ahorro de la lista:",
                style: AppTextStyles.mainStyleGreen14Bold(context),
              ),
              AccountDropdown(
                selectedAccount: _selectedAccount,
                smallSpacing: smallSpacing,
                screenSize: screenSize,
                onAccountSelected: (account) {
                  setState(() {
                    _selectedAccount = account.operationCode;
                    _idSelectedAccount = account.idOperationEntity;
                  });
                },
              ),
              Text(
                isOwnAccounts
                    ? "Seleccione la targeta de crédito a pagar:"
                    : "Introduzca el código de Targeta de crédito a pagar:",
                style: AppTextStyles.mainStyleGreen14Bold(context),
              ),
              if (isOwnAccounts)
                BlocConsumer<SessionInfoBloc, SessionInfoState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is SessionInfoSuccess) {
                      final listCredits =
                          state.userInfoResponseEnttity.listCodeCreditLine;
                      return Card(
                        elevation: smallSpacing * 0.5,
                        child: Container(
                          height: smallSpacing * 3,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.green,
                            ),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenSize.width * 0.05,
                              vertical: smallSpacing * 0.5,
                            ),
                            child: DropdownButton<String>(
                              underline: SizedBox(),
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
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                )
              else
                TextFromFiel02(
                  screenSize: screenSize,
                  smallSpacing: smallSpacing,
                  userController: accountCreditcardController,
                  lbText: 'Cuenta de targeta de Crédito:',
                ),

              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: amountToSendController,
                lbText: 'Monto a pagar:',
              ),
              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: codeMoneyController,
                lbText: 'Moneda:',
              ),
              BlocBuilder<
                CreditCarDataForRecoveryBloc,
                CreditCarDataForRecoveryState
              >(
                builder: (context, state) {
                  if (state is CreditCarDataForRecoverySuccess) {
                    InjectorContainer.getIt<AppRouter>().push(
                      MakePaymentCreditCardForMobileRoute(
                        res: state.creditCardDataForRecovery,
                        cuentaOri: _selectedAccount ?? '',
                        monotPagar: amountToSendController.text,
                        idCreditLineInstance: _selectedLoanId.toString(),
                        idSavingAccount: _idSelectedAccount.toString(),
                      ),
                    );
                  }
                  return Center(
                    child: Butoon1(
                      onTap: () {
                        context.read<CreditCarDataForRecoveryBloc>().add(
                          CreditCarDataForRecorEvent(
                            amountOperation: amountToSendController.text,
                            codeSavingAccountSource: _selectedAccount
                                .toString(),
                            creditCardNumber: isOwnAccounts
                                ? _selectedOperationCode.toString()
                                : accountCreditcardController.text,
                            idCreditLineInstance: _selectedLoanId.toString(),
                            idMoneyOperation: 1,
                          ),
                        );
                      },
                      lblTextField: 'CONTINUAR',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
