import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/dpf/GetListDpfDigitalSolicitation/presentation/bloc/get_list_dpf_digital_solicitation_bloc.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class GetListDpfDigitalSolicitationScreen extends StatelessWidget {
  const GetListDpfDigitalSolicitationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    //final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<GetListDpfDigitalSolicitationBloc>()
            ..add(GEtListDpfDigitSoliEvent()),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Solicitudes de DPF',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body:
            BlocBuilder<
              GetListDpfDigitalSolicitationBloc,
              GetListDpfDigitalSolicitationState
            >(
              builder: (context, state) {
                if (state is GetListDpfDigitalSolicitationSuccess) {
                  final res = state.getListDpfDigitalSolicitationResponseEntity;
                  return Padding(
                    padding: EdgeInsets.all(topPadding * 0.05),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'Solicitudes de DPF',
                            style: AppTextStyles.mainStyleGreen18Bold(context),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: res.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              final data = res.data[index];
                              return Card(
                                elevation: smallSpacing * 0.5,
                                child: Container(
                                  height: screenSize.height * 0.25,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.green,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(topPadding * 0.085),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(topPadding * 0.05),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Fecha Sol:\n'
                                          'Plazo:\n'
                                          'Monto:\n'
                                          'Agencia:\n'
                                          'Cliente:\n'
                                          'Estado:\n'
                                          'Producto:',
                                          style:
                                              AppTextStyles.mainStyleGreen14Bold(
                                                context,
                                              ),
                                        ),
                                        SizedBox(width: smallSpacing * 0.5),
                                        SizedBox(
                                          width: screenSize.width * 0.55,
                                          child: Text(
                                            '${data.realDate}\n'
                                            '${data.term}  \n'
                                            '${data.amount} ${data.moneyName}\n'
                                            '${data.officeName}\n'
                                            '${data.holder}\n'
                                            ' ${data.state}'
                                            '${data.product}',
                                            textAlign: TextAlign.justify,
                                            //maxLines: 2,
                                            style:
                                                AppTextStyles.mainStyleGreen14(
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
                      ),
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
      ),
    );
  }
}
