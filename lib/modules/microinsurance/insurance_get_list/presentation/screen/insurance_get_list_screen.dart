import 'package:app_prodem_v1/config/router/app_router.dart';
import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/bloc.dart';
import 'package:app_prodem_v1/modules/microinsurance/insurance_get_list/presentation/bloc/insurance_get_list_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class InsuranceGetListScreen extends StatefulWidget {
  const InsuranceGetListScreen({super.key});

  @override
  State<InsuranceGetListScreen> createState() => _InsuranceGetListScreenState();
}

class _InsuranceGetListScreenState extends State<InsuranceGetListScreen> {
  final TextEditingController documentController = TextEditingController(
    text: '6753896',
  );

  @override
  void dispose() {
    documentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;

    return BlocProvider(
      create: (context) => InjectorContainer.getIt<InsuranceGetListBloc>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              foregroundColor: Theme.of(context).colorScheme.white,
              backgroundColor: Theme.of(context).colorScheme.green,
              title: Text(
                'Pago Seguro de Terceros',
                style: AppTextStyles.mainStyleWhite18Bold(context),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(topPadding * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PAGO DE SEGUROS DE TERCEROS:',
                    style: AppTextStyles.mainStyleGreen16Bold(context),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Ingrese el nro. de documento de identidad de la persona ejemplo: 123456LP',
                    style: AppTextStyles.mainStyleGreen12(context),
                  ),
                  const SizedBox(height: 10),
                  TextFromFiel02(
                    screenSize: screenSize,
                    smallSpacing: smallSpacing,
                    userController: documentController,
                    lbText: 'Nro. de Documento de Identidad:',
                  ),
                  const SizedBox(height: 10),
                  Butoon1(
                    onTap: () {
                      // ✅ Ahora este context sí tiene acceso al BlocProvider
                      context.read<InsuranceGetListBloc>().add(
                        InsurGetListEvent(
                          identityCardNumber: documentController.text,
                        ),
                      );
                    },
                    lblTextField: 'BUSCAR',
                  ),
                  const SizedBox(height: 20),

                  Expanded(
                    child: BlocConsumer<InsuranceGetListBloc, InsuranceGetListState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is InsuranceGetListLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state is InsuranceGetListSuccess) {
                          final res = state.insuranceGetListResponseEntity.data;

                          if (res.isEmpty) {
                            return Center(
                              child: Text(
                                'No se encontraron seguros pendientes de pago.',
                                style: AppTextStyles.mainStyleGreen14(context),
                              ),
                            );
                          }

                          return Column(
                            children: [
                              SizedBox(height: smallSpacing * 0.5),
                              Text(
                                'Usted tiene los siguientes seguros pendientes de pago',
                                style: AppTextStyles.mainStyleGreen14Bold(
                                  context,
                                ),
                              ),
                              SizedBox(height: smallSpacing * 0.5),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: res.length,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final data = res[index];
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 6.0,
                                      ),
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.green,
                                        ),
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              '${data.asegurado}\n'
                                              '${data.beneficiarios}\n'
                                              'Certificado: ${data.nroCertificado}',
                                              style:
                                                  AppTextStyles.mainStyleGreen14(
                                                    context,
                                                  ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Butoon1(
                                                onTap: () {
                                                  InjectorContainer.getIt<
                                                        AppRouter
                                                      >()
                                                      .push(
                                                        PaymentInsuranceAnnuityRoute(
                                                          data: data,
                                                        ),
                                                      );
                                                },
                                                lblTextField: 'PAGAR',
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                'Bs. ${data.montoTransaccion}',
                                                style:
                                                    AppTextStyles.mainStyleGreen12(
                                                      context,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        }

                        if (state is InsuranceGetListError) {
                          return Center(
                            child: Text(
                              'Error: ${state.message}',
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        }

                        // Estado inicial vacío
                        return const SizedBox();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
