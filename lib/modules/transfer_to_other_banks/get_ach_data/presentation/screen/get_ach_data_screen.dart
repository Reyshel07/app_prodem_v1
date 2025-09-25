import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/create_pr_key_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/get_pr_key_by_id_bloc.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_data/presentation/bloc/get_ach_data_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/router/router.dart';

@RoutePage()
class GetAchDataScreen extends StatelessWidget {
  String cuentaO;
  String montoEn;
  String bancoDes;
  String nombreDes;
  String nit;
  String motivoEn;
  String cuentaDes;
  String cambioM;
  String montoDev;
  String mComision;
  String montoIm;
  String montoTotal;
  GetAchDataScreen({
    super.key,
    required this.bancoDes,
    required this.cambioM,
    required this.cuentaDes,
    required this.cuentaO,
    required this.mComision,
    required this.montoDev,
    required this.montoEn,
    required this.montoIm,
    required this.montoTotal,
    required this.motivoEn,
    required this.nit,
    required this.nombreDes,
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
        body: Column(
          children: [
            Text(
              'Transferencia entre cuentas propias',
              style: AppTextStyles.mainStyleGreen18Bold(context),
            ),
            Row(
              children: [
                Text(
                  'Cuenta ORIGEN:\n'
                  'Saldo disponible:\n'
                  'Monto del envió\n'
                  'Banco DESTINO'
                  'Njombre DESTINATARIO:\n'
                  'Nro.Doc/NIT destinatario:\n'
                  'Motivo del envio:\n'
                  'Cuenta destinatario:\n'
                  'Existecambio de moneda:\n'
                  'Monto DÉBITO:\n'
                  'Monto comisión:\n'
                  'Monto comisión:\n'
                  'Monto impuesto:\n'
                  'Monto total a debitar:',
                ),
                Text(''),
              ],
            ),
            Text(
              'Sólo se validara el número de cuenta del beneficiario, por lo que es responsabilidad del ordenante verificar la informacion registrada.',
              style: AppTextStyles.mainStyleRed10Bold(context),
            ),
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
                            style: AppTextStyles.mainStyleGreen18Bold(context),
                          )
                        else
                          Text(
                            'CÓDIGO PRODEM',
                            style: AppTextStyles.mainStyleGreen18Bold(context),
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
                                        GetAchDataBloc,
                                        GetAchDataState
                                      >(
                                        listener: (context, state) {
                                          if (state is GetAchDataSuccess) {
                                            /*InjectorContainer.getIt<
                                                    AppRouter
                                                  >()
                                                  .push(
                                                    SavingAccountTransMobileEndRoute(
                                                      response: state.,
                                                    ),
                                                  );*/
                                          }
                                          if (state is GetAchDataError) {
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
                                              /*context
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
                                                    );*/
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
            ),
          ],
        ),
      ),
    );
  }
}
