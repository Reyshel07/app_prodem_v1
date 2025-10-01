/*import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/create_pr_key_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/get_pr_key_by_id_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';

@RoutePage()
class ReceiveTransfersByCellPhoneNumberScreen extends StatefulWidget {
  const ReceiveTransfersByCellPhoneNumberScreen({super.key});

  @override
  State<ReceiveTransfersByCellPhoneNumberScreen> createState() =>
      _ReceiveTransfersByCellPhoneNumberScreenState();
}

class _ReceiveTransfersByCellPhoneNumberScreenState
    extends State<ReceiveTransfersByCellPhoneNumberScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<GetAccountEnableToTransferBloc>()
            ..add(GEtAccountEnableToTransEvent()),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Recibir transferencia por numero de celular',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Builder(
          builder: (newcontext) {
            final sessionBloc = context.read<SessionInfoBloc>();
            return BlocBuilder<
              GetAccountEnableToTransferBloc,
              GetAccountEnableToTransferState
            >(
              builder: (context, state) {
                return BlocListener<
                  GetAccountEnableToTransferBloc,
                  GetAccountEnableToTransferState
                >(
                  listener: (context, state) {
                    if (state is GetAccountEnableToTransferSuccess) {
                      /*InjectorContainer.getIt<
                                                            AppRouter
                                                          >()
                                                          .push();*/
                    }
                    if (state is GetAccountEnableToTransferError) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(topPadding * 0.05),
                    child: Column(
                      children: [
                        Text(
                          'HABILITAR CUENTAS TRANSFERENCIAS POR CELULAR:',
                          style: AppTextStyles.mainStyleGreen18Bold(context),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: smallSpacing * 0.5),
                        Text(
                          'Habilite o desabilite una Cuenta de Ahorros para que sus contactos puedan realizarle transferencias por su numero de celular.'
                          'Es de uso exclusivo entre clientes de Banco Prodem S.A. y su Numero de Cuenta no será visible.\n'
                          'Si eleige "Ninguno" la opción queda desabilitada.\n'
                          'La opcion es "Transferencia a cuenta de Terceros" usando el botón:',
                          style: AppTextStyles.mainStyleGreen14(context),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: screenSize.height * 0.3,
                          child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  Checkbox(
                                    value: false,
                                    onChanged: (value) {
                                      setState(
                                        () => isChecked = value ?? false,
                                      );
                                    },
                                  ),
                                  Text('hhhhh'),
                                ],
                              );
                            },
                          ),
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
                            return BlocBuilder<
                              GetPrKeyByIdBloc,
                              GetPrKeyByIdState
                            >(
                              builder: (context, getState) {
                                return Column(
                                  children: [
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
                                        if (createState is CreatePrKeyLoading)
                                          const CircularProgressIndicator(),

                                        if (createState
                                                is! CreatePrKeySuccess &&
                                            createState is! CreatePrKeyLoading)
                                          SizedBox(
                                            width: screenSize.width * 0.4,
                                            child: Card(
                                              elevation: smallSpacing * 0.5,
                                              child: Butoon1(
                                                onTap: () {
                                                  context
                                                      .read<CreatePrKeyBloc>()
                                                      .add(CreatePrKeyEvent1());
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
                                              child: Butoon1(
                                                onTap: () {
                                                  context
                                                      .read<
                                                        GetAccountEnableToTransferBloc
                                                      >()
                                                      .add(
                                                        AccountEnableToTransSaveEvent(
                                                          codeAccount:
                                                              '17098064656442366',
                                                          idSavingAccount:
                                                              '117-2-1-17491-5',
                                                          isActive: true,
                                                        ),
                                                      );
                                                },
                                                lblTextField:
                                                    state
                                                        is GetAccountEnableToTransferLoading
                                                    ? 'Procesando...'
                                                    : 'CONFIRMAR',
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
              },
            );
          },
        ),
      ),
    );
  }
}*/

import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/create_pr_key_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/get_pr_key_by_id_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';

@RoutePage()
class ReceiveTransfersByCellPhoneNumberScreen extends StatefulWidget {
  const ReceiveTransfersByCellPhoneNumberScreen({super.key});

  @override
  State<ReceiveTransfersByCellPhoneNumberScreen> createState() =>
      _ReceiveTransfersByCellPhoneNumberScreenState();
}

class _ReceiveTransfersByCellPhoneNumberScreenState
    extends State<ReceiveTransfersByCellPhoneNumberScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;

    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<GetAccountEnableToTransferBloc>()
            ..add(GEtAccountEnableToTransEvent()),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Recibir transferencia por número de celular',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Builder(
          builder: (newcontext) {
            return BlocBuilder<
              GetAccountEnableToTransferBloc,
              GetAccountEnableToTransferState
            >(
              builder: (context, state) {
                return BlocListener<
                  GetAccountEnableToTransferBloc,
                  GetAccountEnableToTransferState
                >(
                  listener: (context, state) {
                    if (state is GetAccountEnableToTransferSuccess) {
                      // Aquí podrías navegar si necesitas
                      // InjectorContainer.getIt<AppRouter>().push();
                    }
                    if (state is GetAccountEnableToTransferError) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(topPadding * 0.05),
                    child: Column(
                      children: [
                        Text(
                          'HABILITAR CUENTAS TRANSFERENCIAS POR CELULAR:',
                          style: AppTextStyles.mainStyleGreen18Bold(context),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: smallSpacing * 0.5),
                        Text(
                          'Habilite o deshabilite una Cuenta de Ahorros para que sus contactos puedan realizarle transferencias por su número de celular. '
                          'Es de uso exclusivo entre clientes de Banco Prodem S.A. y su Número de Cuenta no será visible.\n'
                          'Si elige "Ninguno" la opción queda deshabilitada.\n'
                          'La opción es "Transferencia a cuenta de Terceros" usando el botón:',
                          style: AppTextStyles.mainStyleGreen14(context),
                          textAlign: TextAlign.justify,
                        ),

                        /// 🔹 Aquí consumimos el SessionInfoBloc para listar las cuentas
                        SizedBox(
                          height: screenSize.height * 0.3,
                          child: BlocBuilder<SessionInfoBloc, SessionInfoState>(
                            builder: (context, sessionState) {
                              if (sessionState is SessionInfoLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (sessionState is SessionInfoSuccess) {
                                final cuentas = sessionState
                                    .userInfoResponseEnttity
                                    .listCodeSavingsAccount;

                                return ListView.builder(
                                  itemCount: cuentas.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                        final cuenta = cuentas[index];
                                        return Row(
                                          children: [
                                            Checkbox(
                                              value: isChecked,
                                              onChanged: (value) {
                                                setState(
                                                  () => isChecked =
                                                      value ?? false,
                                                );
                                              },
                                            ),
                                            Text(
                                              "Cuenta: ${cuenta.operationCode}",
                                              style:
                                                  AppTextStyles.mainStyleGreen14(
                                                    context,
                                                  ),
                                            ),
                                          ],
                                        );
                                      },
                                );
                              } else if (sessionState is SessionInfoError) {
                                return Text(
                                  "Error: ${sessionState.message}",
                                  style: const TextStyle(color: Colors.red),
                                );
                              }
                              return const SizedBox();
                            },
                          ),
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
                            return BlocBuilder<
                              GetPrKeyByIdBloc,
                              GetPrKeyByIdState
                            >(
                              builder: (context, getState) {
                                return Column(
                                  children: [
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
                                        if (createState is CreatePrKeyLoading)
                                          const CircularProgressIndicator(),
                                        if (createState
                                                is! CreatePrKeySuccess &&
                                            createState is! CreatePrKeyLoading)
                                          SizedBox(
                                            width: screenSize.width * 0.4,
                                            child: Card(
                                              elevation: smallSpacing * 0.5,
                                              child: Butoon1(
                                                onTap: () {
                                                  context
                                                      .read<CreatePrKeyBloc>()
                                                      .add(CreatePrKeyEvent1());
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
                                              child: Butoon1(
                                                onTap: () {
                                                  context
                                                      .read<
                                                        GetAccountEnableToTransferBloc
                                                      >()
                                                      .add(
                                                        AccountEnableToTransSaveEvent(
                                                          codeAccount:
                                                              '17098064656442366',
                                                          idSavingAccount:
                                                              '117-2-1-17491-5',
                                                          isActive: true,
                                                        ),
                                                      );
                                                },
                                                lblTextField:
                                                    state
                                                        is GetAccountEnableToTransferLoading
                                                    ? 'Procesando...'
                                                    : 'CONFIRMAR',
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
              },
            );
          },
        ),
      ),
    );
  }
}
