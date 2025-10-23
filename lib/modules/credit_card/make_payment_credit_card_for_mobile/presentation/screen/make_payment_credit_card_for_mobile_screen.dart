import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/credit_card/make_payment_credit_card_for_mobile/presentation/bloc/make_payment_credit_card_for_mobile_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/create_pr_key_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/get_pr_key_by_id_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/prodem_key.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../credit_card_data_for_recovery/domain/entities/entity.dart';

@RoutePage()
class MakePaymentCreditCardForMobileScreen extends StatefulWidget {
  final String cuentaOri;
  final String monotPagar;
  final String idCreditLineInstance;
  final String idSavingAccount;
  final CreditCardDataForRecoveryResponseEntity res;
  const MakePaymentCreditCardForMobileScreen({
    super.key,
    required this.cuentaOri,
    required this.res,
    required this.monotPagar,
    required this.idCreditLineInstance,
    required this.idSavingAccount,
  });

  @override
  State<MakePaymentCreditCardForMobileScreen> createState() =>
      _MakePaymentCreditCardForMobileScreenState();
}

class _MakePaymentCreditCardForMobileScreenState
    extends State<MakePaymentCreditCardForMobileScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<MakePaymentCreditCardForMobileBloc>(),
        ),
        BlocProvider<CreatePrKeyBloc>(
          create: (_) => InjectorContainer.getIt<CreatePrKeyBloc>(),
        ),
        BlocProvider<GetPrKeyByIdBloc>(
          create: (_) => InjectorContainer.getIt<GetPrKeyByIdBloc>(),
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
            children: [
              Text(
                'PAGO DE TARJETA DE CRÉDITO',
                style: AppTextStyles.mainStyleGreen18Bold(context),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cuenta a ORIGEN:\n'
                    'Saldo disponible:\n'
                    'Códigode targeta de crédito:\n'
                    'Moneda tarjeta crédito:\n'
                    'Monto min. pagar:\n'
                    'Monto a pagar:\n'
                    'Saldo menos intereses:\n'
                    'Saldo capital calculado:\n'
                    'Existe cambio de moneda:\n'
                    'Cliente de la tarjeta:',
                    style: AppTextStyles.mainStyleGreen12Bold(context),
                  ),
                  SizedBox(width: smallSpacing * 0.5),
                  SizedBox(
                    width: screenSize.width * 0.5,
                    child: Text(
                      '${widget.cuentaOri}\n'
                      '${widget.res.data.savingBalance}\n'
                      '${widget.res.data.accountNumber}\n'
                      '${widget.res.data.loanCurrencyName}\n'
                      '${widget.res.data.minimumPayment}\n'
                      '${widget.monotPagar}\n'
                      '${widget.res.data.principalBalance}\n'
                      '${widget.res.data.principalBalanceAtc}\n'
                      'NO\n'
                      '${widget.res.data.clientName}',
                      style: AppTextStyles.mainStyleGreen12(context),
                    ),
                  ),
                ],
              ),
              BlocConsumer<
                MakePaymentCreditCardForMobileBloc,
                MakePaymentCreditCardForMobileState
              >(
                listener: (context, state) {
                  if (state is MakePaymentCreditCardForMobileSuccess) {
                    InjectorContainer.getIt<AppRouter>().push(
                      SavingAccountTransMobileEndRoute(
                        response: state
                            .makePaymentCreditCardForMobileResponseEntity
                            .data,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return ProdemKeySection(
                    smallSpacing: smallSpacing,
                    screenSize: screenSize,
                    onConfirm: () {
                      final createState = context.read<CreatePrKeyBloc>().state;

                      if (createState is CreatePrKeySuccess) {
                        final idSms = createState
                            .createProdemKeyResponseEntity
                            .data
                            .toString();

                        context.read<MakePaymentCreditCardForMobileBloc>().add(
                          MakePaymentCreditCardForMoEvent(
                            amountPayment: widget.monotPagar,
                            codeAuthentication: '',
                            creditCardAccountNumber:
                                widget.res.data.accountNumber,
                            customerName: widget.res.data.clientName,
                            idCreditLineInstance: widget.idCreditLineInstance,
                            idLoanCurrency: widget.res.data.idLoanCurrency
                                .toString(),
                            idPersonLogged: '17303255029099749',
                            idSavingAccount: widget.idSavingAccount,
                            idSavingAccountMoney: '1',
                            isOwnCreditCard: true,
                            idSMSOperation: idSms,
                            prodemKeyCode:
                                context.read<GetPrKeyByIdBloc>().state
                                    is GetPrKeyByIdSuccess
                                ? (context.read<GetPrKeyByIdBloc>().state
                                              as GetPrKeyByIdSuccess)
                                          .getProdemKeyByIdResponseEntity
                                          ?.data ??
                                      ''
                                : '',
                          ),
                        );
                      }
                    },
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
