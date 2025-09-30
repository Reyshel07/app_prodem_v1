import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/lightning%20turn/GetProdemExpressSolicitationWeb/presentation/bloc/pr_express_solicitation_web_bloc.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:app_prodem_v1/utils/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class PrExpressSolicitationWebScreen extends StatelessWidget {
  final List<String> listCodeSavingsAccount;
  const PrExpressSolicitationWebScreen({
    super.key,
    required this.listCodeSavingsAccount,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return BlocProvider(
      create: (_) => InjectorContainer.getIt<PrExpressSolicitationWebBloc>()
        ..add(
          PrExpressSoliWebEvent(colCodeSavingsAccounts: listCodeSavingsAccount),
        ),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Detalles de solicitudes de Giro Relampago',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body:
            BlocBuilder<
              PrExpressSolicitationWebBloc,
              PrExpressSolicitationWebState
            >(
              builder: (context, state) {
                if (state is PrExpressSolicitationWebSuccess) {
                  final res =
                      state.getProdemExpressSolicitationWebResponseEntity;

                  return Column(
                    children: [
                      Text(
                        'Detalles de Solicitud de Giro relámpago',
                        style: AppTextStyles.mainStyleGreen18Bold(context),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.5,
                        child: ListView.builder(
                          itemCount: res.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            final data = res.data[index];
                            return Card(
                              elevation: smallSpacing * 0.5,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).colorScheme.green,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    radiusCircular(topPadding * 0.05),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(topPadding * 0.05),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Nro Cuenta:\n'
                                        'Doc. destinatario:\n'
                                        'Destinatario:\n'
                                        'Monto:\n'
                                        'Celular:\n'
                                        'Fecha:',
                                        style:
                                            AppTextStyles.mainStyleGreen12Bold(
                                              context,
                                            ),
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        '${data.codeSavingsAccount}\n'
                                        '${data.beneficiaryDi}\n'
                                        '${data.beneficiaryName}\n'
                                        '${data.amountTransaction}\n'
                                        '${data.cellPhoneBeneficiary}\n'
                                        '${DateFormatter.formatDateTime(data.solicitationDate)}',
                                        style: AppTextStyles.mainStyleGreen12(
                                          context,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          context
                                              .read<
                                                PrExpressSolicitationWebBloc
                                              >()
                                              .add(
                                                PrDeleteEvent(
                                                  data.idProdemExpressSolicitation
                                                      .toString(),
                                                ),
                                              );
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.green,
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
                  );
                }
                return CircularProgressIndicator();
              },
            ),
      ),
    );
  }
}
