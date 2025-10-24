import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/bank_guarantees/get_web_bank_guarantee_solicitation_data/presentation/bloc/get_web_bank_guarantee_solicitation_data_bloc.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:app_prodem_v1/utils/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*@RoutePage()
class WebBankGuaranteeSoliScreen extends StatelessWidget {
  const WebBankGuaranteeSoliScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<GetWebBankGuaranteeSolicitationDataBloc>()
            ..add(GetWebBamkGuaranteeSoliEvent()),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Detalle Fianzas Bancarias',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body:
            BlocBuilder<
              GetWebBankGuaranteeSolicitationDataBloc,
              GetWebBankGuaranteeSolicitationDataState
            >(
              builder: (context, state) {
                if (state is GetWebBankGuaranteeSolicitationDataSuccess) {
                  final res = state
                      .getWebBankGuaranteeSolicitationDataResponseEntity
                      .data;
                  return Padding(
                    padding: EdgeInsets.all(topPadding * 0.05),
                    child: Column(
                      children: [
                        Text(
                          'Detalle Fianzas Bancarias',
                          style: AppTextStyles.mainStyleGreen14Bold(context),
                        ),
                        Text(
                          'Muy Importante',
                          style: AppTextStyles.mainStyleGreen16Bold(context),
                        ),
                        Text(
                          'Estimado cliente para recoger su fianza bancaria no olvide llevar la siguiente documentacion:',
                          style: AppTextStyles.mainStyleGreen14Bold(context),
                        ),
                        Text(
                          '-Fotocopia de CI\n'
                          '-Carta de solicitud\n'
                          '-Inivitación pública o escrita (seriedad de propuestas)\n'
                          '-Contrato de adjudicación y otros (si corresponde)',
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: res.length,
                          itemBuilder: (BuildContext context, int index) {
                            final data = res[index];
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Agencia:\n'
                                        'Código:\n'
                                        'Estado:\n'
                                        'Fecha Solicitud:\n'
                                        'Monto:\n'
                                        'Moneda\n'
                                        'Beneficiario:',
                                        style:
                                            AppTextStyles.mainStyleGreen14Bold(
                                              context,
                                            ),
                                      ),
                                      Text(
                                        '${data.officeName}\n'
                                        '${data.solicitationCode}\n'
                                        '${data.solicitationStateName}\n'
                                        '${DateFormatter.formatDateTime(data.solicitationDate)}\n'
                                        '${data.amount}\n'
                                        '${data.money}\n'
                                        '${data.beneficiaryName}',
                                        style: AppTextStyles.mainStyleGreen14(
                                          context,
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
                  );
                }
                return CircularProgressIndicator();
              },
            ),
      ),
    );
  }
}
*/

@RoutePage()
class WebBankGuaranteeSoliScreen extends StatelessWidget {
  final String filterType;

  const WebBankGuaranteeSoliScreen({super.key, required this.filterType});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;

    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<GetWebBankGuaranteeSolicitationDataBloc>()
            ..add(GetWebBamkGuaranteeSoliEvent()),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Detalle Fianzas Bancarias',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body:
            BlocBuilder<
              GetWebBankGuaranteeSolicitationDataBloc,
              GetWebBankGuaranteeSolicitationDataState
            >(
              builder: (context, state) {
                if (state is GetWebBankGuaranteeSolicitationDataSuccess) {
                  final allData = state
                      .getWebBankGuaranteeSolicitationDataResponseEntity
                      .data;

                  final filteredData = allData.where((data) {
                    final stateName = (data.idcSolicitationState)
                        .toString()
                        .toLowerCase();
                    final filter = filterType.trim().toLowerCase();

                    if (filter == '9538') {
                      return stateName == '9538';
                    } else if (filter == '9537' || filter == '9537') {
                      return stateName == '9537' || stateName == '9537';
                    }
                    return true;
                  }).toList();
                  if (filteredData.isEmpty) {
                    return Center(
                      child: Text(
                        'No hay registros para "$filterType"',
                        style: AppTextStyles.mainStyleGreen14Bold(context),
                      ),
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.all(topPadding * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Detalle Fianzas Bancarias',
                          style: AppTextStyles.mainStyleGreen14Bold(context),
                        ),
                        Text(
                          'Muy Importante',
                          style: AppTextStyles.mainStyleGreen16Bold(context),
                        ),
                        Text(
                          'Estimado cliente para recoger su fianza bancaria no olvide llevar la siguiente documentacion:',
                          style: AppTextStyles.mainStyleGreen14Bold(context),
                        ),
                        Text(
                          '-Fotocopia de CI\n'
                          '-Carta de solicitud\n'
                          '-Inivitación pública o escrita (seriedad de propuestas)\n'
                          '-Contrato de adjudicación y otros (si corresponde)',
                        ),
                        SizedBox(height: smallSpacing * 0.5),
                        Expanded(
                          child: ListView.builder(
                            itemCount: filteredData.length,
                            itemBuilder: (BuildContext context, int index) {
                              final data = filteredData[index];
                              return Card(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Agencia:\n'
                                          'Código:\n'
                                          'Estado:\n'
                                          'Fecha Solicitud:\n'
                                          'Monto:\n'
                                          'Moneda:\n'
                                          'Beneficiario:',
                                          style:
                                              AppTextStyles.mainStyleGreen14Bold(
                                                context,
                                              ),
                                        ),
                                        Text(
                                          '${data.officeName}\n'
                                          '${data.solicitationCode}\n'
                                          '${data.solicitationStateName}\n'
                                          '${DateFormatter.formatDateTime(data.solicitationDate)}\n'
                                          '${data.amount}\n'
                                          '${data.money}\n'
                                          '${data.beneficiaryName}',
                                          style: AppTextStyles.mainStyleGreen14(
                                            context,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
      ),
    );
  }
}
