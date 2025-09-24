import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/create_pr_key_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/get_pr_key_by_id_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/router/router.dart';
import '../../../transfer_between_accounts/savings_account_transfer_mobile/presentation/bloc/bloc.dart';

@RoutePage()
class TransferFeesTwoScreen extends StatelessWidget {
  final String? cuentaO;
  final String? saldo;
  final String? monto;
  final String? cuentaD;
  final List<String>? titulares;
  const TransferFeesTwoScreen({
    super.key,
    required this.cuentaO,
    required this.cuentaD,
    required this.monto,
    required this.saldo,
    required this.titulares,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    //final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InjectorContainer.getIt<CreatePrKeyBloc>(),
        ),
        BlocProvider(
          create: (contex) => InjectorContainer.getIt<GetPrKeyByIdBloc>(),
        ),
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<SavingAccountTransferMobileBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Transferencia entre cuentas propias',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(topPadding * 0.05),
          child: Column(
            children: [
              Text(
                'TRANSFERENCIA ENTRE CUENTAS PROPIAS',
                style: AppTextStyles.mainStyleGreen18Bold(context),
              ),
              SizedBox(height: smallSpacing * 0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cuenta ORIGEN:\n'
                    'Saldodisponible:\n'
                    'Monto transferencia:\n'
                    'Cuenta DESTINO:\n'
                    'Existe cambio de moneda:\n'
                    'Titulares destino:',
                    style: AppTextStyles.mainStyleGreen14Bold(context),
                  ),
                  SizedBox(width: smallSpacing * 0.5),
                  SizedBox(
                    width: screenSize.width * 0.45,
                    child: Text(
                      '$cuentaO\n'
                      '$saldo\n'
                      '$monto\n'
                      '$cuentaD\n'
                      'no\n'
                      '${titulares?.join(",")}',
                      textAlign: TextAlign.start,
                      style: AppTextStyles.mainStyleGreen14(context),
                    ),
                  ),
                ],
              ),
              SizedBox(height: smallSpacing * 0.5),
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
                  return BlocBuilder<GetPrKeyByIdBloc, GetPrKeyByIdState>(
                    builder: (context, getState) {
                      return Column(
                        children: [
                          // 🔹 Texto dinámico según el estado de GetKey
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
                                          SavingAccountTransferMobileBloc,
                                          SavingAccountTransferMobileState
                                        >(
                                          listener: (context, state) {
                                            if (state
                                                is SavingAccountTransferMobileSuccess) {
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
                                                is SavingAccountTransferMobiletaError) {
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
                                                      SavingAccountTransferMobileBloc
                                                    >()
                                                    .add(
                                                      SavingAccountTransMoEvent(
                                                        codeSavingAccountSource:
                                                            cuentaO ?? '',
                                                        codeSavingAccountTarget:
                                                            cuentaD ?? '',
                                                        amountTransfer:
                                                            monto ?? '',
                                                        idMoneyTransfer: '1',
                                                        isNaturalCustomer: true,
                                                        observation:
                                                            'observation',
                                                        reasonDestiny:
                                                            'reasonDestiny',
                                                        typeApplicationAccessX:
                                                            '112582',
                                                        idTerminal: '2',
                                                        userAppOriginType: '2',
                                                        beneficiaryName:
                                                            'beneficiaryName',
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
                                                      is SavingAccountTransferMobileLoading
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
        ),
      ),
    );
  }
}
