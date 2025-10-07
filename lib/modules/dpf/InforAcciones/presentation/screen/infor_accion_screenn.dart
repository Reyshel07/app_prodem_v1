import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/dpf/InforAcciones/presentation/bloc/infor_acciones_bloc.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class InforAccionesScreen extends StatelessWidget {
  const InforAccionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    //final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<InforAccionesBloc>()..add(InfAccionEvent()),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'ProdemMóvil',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: BlocBuilder<InforAccionesBloc, InforAccionesState>(
          builder: (context, state) {
            if (state is InforAccionesSuccess) {
              final res = state.inforAccionesEntity;
              final data1 = state.dpfExpiracion;
              return Column(
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
                    itemCount: data1?.length,
                    itemBuilder: (context, index) {
                      final data = data1?[index];
                      return Card(
                        elevation: smallSpacing * 0.5,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.green,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(topPadding * 0.05),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Departamento:\n'
                                  'Código DPF:\n'
                                  'Capital Bs:\n'
                                  'Interes:\n'
                                  'Monto total al cierre:\n'
                                  'Tipo Moneda:\n'
                                  'Detalle:',
                                  style: AppTextStyles.mainStyleGreen12Bold(
                                    context,
                                  ),
                                ),
                                SizedBox(width: smallSpacing * 0.5),
                                SizedBox(
                                  width: screenSize.width * 0.55,
                                  child: Text(
                                    '${data?.departamento}\n'
                                    '${data?.codigoDpf}\n'
                                    '${data?.monto}\n'
                                    '${data?.interes}\n'
                                    '${data?.capitalARenovar}\n'
                                    '${data?.moneda}\n'
                                    '${data?.depositProduct}',
                                    textAlign: TextAlign.justify,
                                    style: AppTextStyles.mainStyleGreen12(
                                      context,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
