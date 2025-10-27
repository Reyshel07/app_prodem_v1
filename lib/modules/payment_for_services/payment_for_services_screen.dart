import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/screen/savings_products/savings_products_screen.dart';
import 'package:app_prodem_v1/modules/payment_for_services/sintesis_get_search_parameters_by_module/presentation/bloc/sintesis_get_search_parameters_by_module_bloc.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PaymentForServicesScreen extends StatefulWidget {
  const PaymentForServicesScreen({super.key});

  @override
  State<PaymentForServicesScreen> createState() =>
      _PaymentForServicesScreenState();
}

class _PaymentForServicesScreenState extends State<PaymentForServicesScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<SintesisGetSearchParametersByModuleBloc>(),
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
              SintesisGetSearchParametersByModuleBloc,
              SintesisGetSearchParametersByModuleState
            >(
              builder: (context, state) {
                if (state is SintesisGetSearchParametersByModuleSuccess) {
                  InjectorContainer.getIt<AppRouter>().push(
                    SintesisGetSearchParametersByModuleRoute(
                      name: state.name ?? '',
                      description: state.description ?? '',
                      data: state
                          .sintesisGetSearchParametersByModuleResponseEntity
                          .data,
                    ),
                  );
                }
                return ListView(
                  children: [
                    Column(
                      children: [
                        Card(
                          elevation: smallSpacing * 0.5,
                          child: Container(
                            height: screenSize.height * 0.065,
                            width: screenSize.width * 0.95,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).colorScheme.green,
                              ),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(topPadding * 0.08),
                              child: Text(
                                'Mis Favoritos',
                                textAlign: TextAlign.start,
                                style: AppTextStyles.mainStyleGreen16Bold(
                                  context,
                                ),
                              ),
                            ),
                          ),
                        ),
                        ListTitlePrueba(
                          topPadding: topPadding,
                          smallSpacing: smallSpacing,
                          letterSize: letterSize,
                          title: 'Electricidad',
                          icon: Icons.savings,
                          column: Column(
                            children: [
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '9999',
                                          name: 'CESSA',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.compare_arrows,
                                title: 'CESSA',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '2222',
                                          name: 'DELAPAZ',
                                          description:
                                              'Por favor ingrese el número de cliente.\nDebe ingresar el numero de la misma forma en la que figura en la factura, incluidos los guiones.',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.account_balance,
                                title: 'DELAPAZ',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '2222',
                                          name: 'ENDE DELBENI',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.receipt_long,
                                title: 'ENDE DELBENI',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '3333',
                                          name: 'ELFEC',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.compare_arrows,
                                title: 'ELFEC',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '3333',
                                          name: 'ENDE CORPORACIÓN',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.send,
                                title: 'ENDE CORPORACIÓN',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '1113',
                                          name: 'SEPSA',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.compare_arrows,
                                title: 'SEPSA',
                              ),

                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '1001',
                                          name: 'CRE',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.confirmation_num,
                                title: 'CRE',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '41',
                                          name: 'SETAR',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.confirmation_num,
                                title: 'SETAR',
                              ),
                              SizedBox(height: smallSpacing * 1),
                            ],
                          ),
                        ),
                        ListTitlePrueba(
                          topPadding: topPadding,
                          smallSpacing: smallSpacing,
                          letterSize: letterSize,
                          title: 'Agua Potable',
                          icon: Icons.broadcast_on_home,
                          column: Column(
                            children: [
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '2222',
                                          name: 'EPSAS',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'EPSAS',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '2222',
                                          name: 'ELAPAS',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'ELAPAS',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '1002',
                                          name: 'SAGUAPAC',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'SAGUAPAC',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '1004',
                                          name: 'COSAALT',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'COSAALT',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '575',
                                          name: 'SEMAPA',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'SEMAPA',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '1048',
                                          name: 'COOPLAN',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'COOPLAN',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '568',
                                          name: 'COSAPCO',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'COSAPCO',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '556',
                                          name: 'COOPAPPI',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'COOPAPPI',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '566',
                                          name: 'SAJUBA',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'SAJUBA',
                              ),
                            ],
                          ),
                        ),
                        ListTitlePrueba(
                          topPadding: topPadding,
                          smallSpacing: smallSpacing,
                          letterSize: letterSize,
                          title: 'Gas Domiciliario',
                          icon: Icons.broadcast_on_home,
                          column: Column(
                            children: [
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: 'YPFB = 8888,',
                                          name: 'YPFB',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'YPFB',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '161',
                                          name: 'EMTAGAS ',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'EMTAGAS ',
                              ),
                            ],
                          ),
                        ),
                        ListTitlePrueba(
                          topPadding: topPadding,
                          smallSpacing: smallSpacing,
                          letterSize: letterSize,
                          title: 'Telecomunicaciones',
                          icon: Icons.broadcast_on_home,
                          column: Column(
                            children: [
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '8',
                                          name: 'ENTEL',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'ENTEL',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '141',
                                          name: 'GoLochTel',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'GoLochTel',
                              ),
                            ],
                          ),
                        ),
                        ListTitlePrueba(
                          topPadding: topPadding,
                          smallSpacing: smallSpacing,
                          letterSize: letterSize,
                          title: 'Seguridad Social',
                          icon: Icons.broadcast_on_home,
                          column: Column(
                            children: [
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '141',
                                          name: 'Gestora Pública',
                                          description:
                                              'Por favor ingrese el número de identificacion y el número de formulario.\n En caso de que su documento de identificación sea CI y tenga complemnto, ingrese el mismo campo correspondiente.',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'Gestora Pública',
                              ),
                            ],
                          ),
                        ),
                        ListTitlePrueba(
                          topPadding: topPadding,
                          smallSpacing: smallSpacing,
                          letterSize: letterSize,
                          title: 'Univercidades',
                          icon: Icons.broadcast_on_home,
                          column: Column(
                            children: [
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '58',
                                          name: 'UMSA',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'UMSA',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '59',
                                          name: 'UAGRM',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'UAGRM',
                              ),
                            ],
                          ),
                        ),
                        ListTitlePrueba(
                          topPadding: topPadding,
                          smallSpacing: smallSpacing,
                          letterSize: letterSize,
                          title: 'Seguros',
                          icon: Icons.broadcast_on_home,
                          column: Column(
                            children: [
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '118',
                                          name: 'SOAT UNIVida',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'SOAT UNIVida',
                              ),
                            ],
                          ),
                        ),
                        ListTitlePrueba(
                          topPadding: topPadding,
                          smallSpacing: smallSpacing,
                          letterSize: letterSize,
                          title: 'Empresas',
                          icon: Icons.broadcast_on_home,
                          column: Column(
                            children: [
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '40',
                                          name: 'Kantutani',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'Kantutani',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '68',
                                          name: 'PagosNET',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'PagosNET',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '76',
                                          name: 'TUPPERWARE',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'TUPPERWARE',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '66',
                                          name: 'Yanbal',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'Yanbal',
                              ),
                            ],
                          ),
                        ),
                        ListTitlePrueba(
                          topPadding: topPadding,
                          smallSpacing: smallSpacing,
                          letterSize: letterSize,
                          title: 'ProdemVida',
                          icon: Icons.broadcast_on_home,
                          column: Column(
                            children: [
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '66',
                                          name: 'Pólizas Propias',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'Pólizas Propias',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '66',
                                          name: 'Pólizas de terceros',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'Pólizas de terceros',
                              ),
                            ],
                          ),
                        ),
                        ListTitlePrueba(
                          topPadding: topPadding,
                          smallSpacing: smallSpacing,
                          letterSize: letterSize,
                          title: 'RUAT',
                          icon: Icons.broadcast_on_home,
                          column: Column(
                            children: [
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '66',
                                          name: 'Vehiculos',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'Vehiculos',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '66',
                                          name: 'Inmuebles',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'Inmuebles',
                              ),
                              Gesture(
                                onTap: () {
                                  context
                                      .read<
                                        SintesisGetSearchParametersByModuleBloc
                                      >()
                                      .add(
                                        SintesisGetSearchParametersByMoEvent(
                                          externalModule: '66',
                                          name: 'Infracciones',
                                          description:
                                              'Seleccione el critrerio por el que desea realizar la búsqueda',
                                        ),
                                      );
                                },
                                topPadding: topPadding,
                                letterSize: letterSize,
                                small: smallSpacing,
                                icon: Icons.abc_outlined,
                                title: 'Infracciones',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
      ),
    );
  }
}
