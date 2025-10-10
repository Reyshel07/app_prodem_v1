import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/utils/text.dart';
import 'package:flutter/material.dart';

@RoutePage()
// ignore: must_be_immutable
class DecryptQrDetailsScreen extends StatelessWidget {
  String cuenta;
  String saldo;
  String monto;
  String cambioMoneda;
  DecryptQrDetailsScreen({
    super.key,
    required this.cuenta,
    required this.saldo,
    required this.monto,
    required this.cambioMoneda,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return Scaffold(
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
            /*BlocConsumer<CreatePrKeyBloc, CreatePrKeyState>(
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
                  return BlocBuilder<GetPrKeyByIdBloc, GetPrKeyByIdState>(
                    builder: (context, getState) {
                      return Column(
                        children: [
                          if (getState is GetPrKeyByIdSuccess)
                            Text(
                              getState.getProdemKeyByIdResponseEntity?.data ??
                                  '---',
                              style: AppTextStyles.mainStyleGreen18Bold(
                                context,
                              ),
                            )
                          else
                            Text(
                              'CÓDIGO PRODEM',
                              style: AppTextStyles.mainStyleGreen18Bold(
                                context,
                              ),
                            ),

                          SizedBox(height: smallSpacing * 0.5),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (createState is CreatePrKeyLoading)
                                const CircularProgressIndicator(),

                              if (createState is! CreatePrKeySuccess &&
                                  createState is! CreatePrKeyLoading)
                                SizedBox(
                                  width: screenSize.width * 0.4,
                                  child: Card(
                                    elevation: smallSpacing * 0.5,
                                    child: Butoon1(
                                      onTap: () {
                                        context.read<CreatePrKeyBloc>().add(
                                          CreatePrKeyEvent1(),
                                        );
                                      },
                                      lblTextField: 'OBTENER CÓDIGO',
                                    ),
                                  ),
                                ),

                              if (createState is CreatePrKeySuccess &&
                                  getState is GetPrKeyByIdSuccess)
                                SizedBox(
                                  width: screenSize.width * 0.3,
                                  child: Card(
                                    elevation: smallSpacing * 0.5,
                                    child:
                                        BlocConsumer<
                                          TransferAchFromMobileBankingBloc,
                                          TransferAchFromMobileBankingState
                                        >(
                                          listener: (context, state) {
                                            if (state
                                                is TransferAchFromMobileBankingSuccess) {
                                              InjectorContainer.getIt<
                                                    AppRouter
                                                  >()
                                                  .push(
                                                    SavingAccountTransMobileEndRoute(
                                                      response: state.data,
                                                    ),
                                                  );
                                            }
                                            if (state
                                                is TransferAchFromMobileBankingError) {
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text(state.message),
                                                ),
                                              );
                                            }
                                          },
                                          builder: (context, state) {
                                            return Butoon1(
                                              onTap: () {
                                                context
                                                    .read<
                                                      TransferAchFromMobileBankingBloc
                                                    >()
                                                    .add(
                                                      TransferAchFromMobBanEvent(
                                                        beneficiary: nombreDes,
                                                        idBankDestiny:
                                                            idBankDestiny,
                                                        idMoney: '1',
                                                        idSavingAccount:
                                                            '17098064656442366',
                                                        identityCardNumber: '',
                                                        accountNumber:
                                                            cuentaDes,
                                                        commissionAmount: '0',
                                                        observation: 'k,ujk,j',
                                                        amount: '23',
                                                        amountSolicitation:
                                                            '23',
                                                        applyGeneratePCC01:
                                                            false,
                                                        reasonDestinyPCC01:
                                                            '23',
                                                        bankDestinyName:
                                                            bancoDes,
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
                                                  state is GetAchDataLoading
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
              ),*/
          ],
        ),
      ),
    );
  }
}
