import 'package:app_prodem_v1/config/router/app_router.dart';
import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/dpf/InforAcciones/presentation/bloc/check_ownership_edv_bloc.dart';
import 'package:app_prodem_v1/modules/dpf/InforAcciones/presentation/bloc/infor_acciones_bloc.dart';
import 'package:app_prodem_v1/modules/dpf/infor_acciones_two/presentation/bloc/infor_acciones_two_bloc.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class InforAccionesScreen extends StatelessWidget {
  final String tipo;
  final SessionInfoBloc sessionBloc;
  const InforAccionesScreen({
    super.key,
    required this.tipo,
    required this.sessionBloc,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<InforAccionesBloc>()
                ..add(InfAccionEvent()),
        ),
        BlocProvider(
          create: (context) => InjectorContainer.getIt<InforAccionesTwoBloc>(),
        ),
        BlocProvider(
          create: (context) => InjectorContainer.getIt<CheckOwnershipEdvBloc>(),
        ),
        BlocProvider.value(value: sessionBloc),
      ],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'ProdemMóvil',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),

        body: MultiBlocListener(
          listeners: [
            BlocListener<InforAccionesTwoBloc, InforAccionesTwoState>(
              listener: (context, state) {
                if (state is InforAccionesTwoSuccess) {
                  InjectorContainer.getIt<AppRouter>().push(
                    InforAccionesTwoRoute(
                      tipo: "Renovación",
                      data: state.inforAccionesEntity,
                    ),
                  );
                }
              },
            ),
            BlocListener<CheckOwnershipEdvBloc, CheckOwnershipEdvState>(
              listener: (context, state) {
                if (state is CheckOwnershipEdvSuccess) {
                  InjectorContainer.getIt<AppRouter>().push(
                    VerificaPlazoRenovacionRoute(
                      text: 'Cancelación',
                      sessionBloc: sessionBloc,
                      data: state.data1,
                    ),
                  );
                }
              },
            ),
          ],

          child: BlocBuilder<InforAccionesBloc, InforAccionesState>(
            builder: (context, state) {
              if (state is InforAccionesSuccess) {
                final res = state.inforAccionesEntity;
                final data1 = state.dpfExpiracion;

                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(topPadding * 0.05),
                    child: Column(
                      children: [
                        Text(
                          res[0].info,
                          style: AppTextStyles.mainStyleGreen16Bold(context),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Seleccione un DPF:',
                          style: AppTextStyles.mainStyleGreen14Bold(context),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data1?.length,
                          itemBuilder: (context, index) {
                            final data = data1?[index];
                            return GestureDetector(
                              onTap: () {
                                if (tipo == "Renovación") {
                                  context.read<InforAccionesTwoBloc>().add(
                                    InfAccionesTwo(
                                      idDpfMfInitial:
                                          data?.idFixedTermDepositAccount ??
                                          ''.toString(),
                                      idcInfoType: '1',
                                    ),
                                  );
                                } else if (tipo == "Cancelación") {
                                  context.read<CheckOwnershipEdvBloc>().add(
                                    CheckOwnershipEdvEv(
                                      idFixedAcount:
                                          data?.idFixedTermDepositAccount ??
                                          ''.toString(),
                                      data: data,
                                    ),
                                  );
                                }
                              },
                              child: Card(
                                elevation: smallSpacing * 0.5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.green,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(topPadding * 0.05),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Departamento:\n'
                                          'Código DPF:\n'
                                          'Capital Bs:\n'
                                          'Interes:\n'
                                          'Monto total al cierre:\n'
                                          'Tipo Moneda:\n'
                                          'Detalle:',
                                          style:
                                              AppTextStyles.mainStyleGreen12Bold(
                                                context,
                                              ),
                                        ),
                                        SizedBox(width: smallSpacing * 0.5),
                                        SizedBox(
                                          width: screenSize.width * 0.53,
                                          child: Text(
                                            '${data?.departamento}\n'
                                            '${data?.codigoDpf}\n'
                                            '${data?.monto}\n'
                                            '${data?.interes}\n'
                                            '${data?.capitalARenovar}\n'
                                            '${data?.moneda}\n'
                                            '${data?.depositProduct}',
                                            textAlign: TextAlign.justify,
                                            style:
                                                AppTextStyles.mainStyleGreen12(
                                                  context,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
