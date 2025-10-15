import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/get_external_payment_generate_file_by_web_client/presentation/bloc/get_external_payment_generate_file_web_client_bloc.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ExternalPaymentGenerateFileWebClientScreen extends StatelessWidget {
  const ExternalPaymentGenerateFileWebClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<GetExternalPaymentGenerateFileWebClientBloc>()
            ..add(GetExternalPaymentGenerateFileWebCliEvent(initPage: '1')),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'ProdemMóvil',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body:
            BlocBuilder<
              GetExternalPaymentGenerateFileWebClientBloc,
              GetExternalPaymentGenerateFileWebClientState
            >(
              builder: (context, state) {
                if (state is GetExternalPaymentGenerateFileWebClientSuccess) {
                  final res = state
                      .getExternalPaymentGenerateFileByWebClientResponseEntity
                      .data;
                  return Column(
                    children: [
                      Text(
                        'Transacciones realizadas.',
                        style: AppTextStyles.mainStyleGreen18Bold(context),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: res.length,
                          itemBuilder: (BuildContext context, int index) {
                            final data = res[index];
                            return Card(
                              elevation: smallSpacing * 0.5,
                              child: Container(
                                //margin: EdgeInsetsGeometry.all(topPadding * 0.05),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.transparente,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    topPadding * 0.05,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(topPadding * 0.08),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Fecha:\n'
                                            'Detalle:\n'
                                            'Monto:\n'
                                            'Canal',
                                            style:
                                                AppTextStyles.mainStyleGreen14Bold(
                                                  context,
                                                ),
                                          ),
                                          SizedBox(width: smallSpacing * 0.5),
                                          SizedBox(
                                            width: screenSize.width * 0.7,
                                            child: Text(
                                              '${data.displayDate}\n'
                                              '${data.fileDescription}\n'
                                              '${data.totalPayment} ${data.currencyCode}\n'
                                              '${data.channel}',
                                              style:
                                                  AppTextStyles.mainStyleGreen14(
                                                    context,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: smallSpacing * 0.5),
                                      ElevatedButton(
                                        onPressed: () {
                                          InjectorContainer.getIt<AppRouter>()
                                              .push(
                                                SavingAccountTransMobileEndRoute(
                                                  response: data.voucherData,
                                                ),
                                              );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Theme.of(
                                            context,
                                          ).colorScheme.green,
                                          padding: EdgeInsets.symmetric(
                                            vertical: 3,
                                            horizontal: 5,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'DETALLE',
                                          style:
                                              AppTextStyles.mainStyleWhite12Bold(
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
