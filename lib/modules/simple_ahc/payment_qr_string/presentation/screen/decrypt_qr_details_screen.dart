import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/create_pr_key_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/get_pr_key_by_id_bloc.dart';
import 'package:app_prodem_v1/modules/simple_ahc/decrypt_qr_string/domain/entities/decrypt_qr_string_entity.dart';
import 'package:app_prodem_v1/modules/simple_ahc/payment_qr_string/presentation/bloc/payment_qr_string_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/prodem_key.dart';
import 'package:app_prodem_v1/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DecryptQrDetailsScreen extends StatelessWidget {
  final DecryptQrStringEntity decryptQrStringEntity;
  final String cuenta;
  final String saldo;
  final String monto;
  final String cambioMoneda;
  final String stringQr;
  const DecryptQrDetailsScreen({
    super.key,
    required this.cuenta,
    required this.saldo,
    required this.monto,
    required this.cambioMoneda,
    required this.decryptQrStringEntity,
    required this.stringQr,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InjectorContainer.getIt<PaymentQrStringBloc>(),
        ),
        BlocProvider(
          create: (context) => InjectorContainer.getIt<CreatePrKeyBloc>(),
        ),
        BlocProvider(
          create: (contex) => InjectorContainer.getIt<GetPrKeyByIdBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Pago QR Prodem',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(topPadding * 0.05),
          child: Column(
            children: [
              Text(
                'PAGO DE QR:',
                style: AppTextStyles.mainStyleGreen18Bold(context),
              ),
              Row(
                children: [
                  Text(
                    'Cuenta ORIGEN:\n'
                    'Saldo disponible:\n'
                    'Monto Transferencia:\n'
                    'Existecambio de moneda:',
                    style: AppTextStyles.mainStyleGreen14Bold(context),
                  ),
                  SizedBox(width: smallSpacing * 0.5),
                  Text(
                    '$cuenta\n'
                    '$saldo\n'
                    '$monto\n'
                    '$cambioMoneda',
                    style: AppTextStyles.mainStyleGreen14(context),
                  ),
                ],
              ),
              BlocConsumer<PaymentQrStringBloc, PaymentQrStringState>(
                listener: (context, state) {
                  if (state is PaymentQrStringSuccess) {
                    InjectorContainer.getIt<AppRouter>().push(
                      SavingAccountTransMobileEndRoute(
                        response: state.paymentQrStringEntity.reportString,
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
                        context.read<PaymentQrStringBloc>().add(
                          PaymentQrEvent(
                            codeAccountDestiny:
                                decryptQrStringEntity.codeAccount,
                            codeMoney: decryptQrStringEntity.codeMoney,
                            codePaymentAccount: cuenta,
                            codeQr: decryptQrStringEntity.codeQr,
                            codeService: decryptQrStringEntity.codeService,
                            receiverIdentityCardNumber: decryptQrStringEntity
                                .receiverIdentityCardNumber,
                            receiverName: decryptQrStringEntity.receiverName,
                            reference: decryptQrStringEntity.reference,
                            bankCode: decryptQrStringEntity.bankCode,
                            amount: decryptQrStringEntity.amount.toString(),
                            isSingleUse: decryptQrStringEntity.isSingleUse,
                            expirationDate: decryptQrStringEntity.expirationDate
                                .toString(),
                            stringQr: stringQr,
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
