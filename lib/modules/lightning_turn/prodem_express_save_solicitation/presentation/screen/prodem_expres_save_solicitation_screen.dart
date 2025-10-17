import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/create_pr_key_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/get_pr_key_by_id_bloc.dart';
import 'package:app_prodem_v1/modules/lightning_turn/GetProdemExpressData/domain/entities/express_data_entity.dart';
import 'package:app_prodem_v1/modules/lightning_turn/prodem_express_save_solicitation/presentation/bloc/prodem_express_save_solicitation_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/prodem_key.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ExpressDataTwoScreen extends StatelessWidget {
  final GetProdemExpressDataResponseEntity res;
  final String cuentaOri;
  final String ciDesti;
  final String desti;
  final String celDesti;
  final String cambioMo;
  final String montoDebi;
  final String montoImp;
  final String montoTotalDebi;
  const ExpressDataTwoScreen({
    super.key,
    required this.res,
    required this.cambioMo,
    required this.celDesti,
    required this.ciDesti,
    required this.cuentaOri,
    required this.desti,
    required this.montoDebi,
    required this.montoImp,
    required this.montoTotalDebi,
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
              InjectorContainer.getIt<ProdemExpressSaveSolicitationBloc>(),
        ),
        BlocProvider<CreatePrKeyBloc>(
          create: (_) => InjectorContainer.getIt<CreatePrKeyBloc>(),
        ),
        BlocProvider<GetPrKeyByIdBloc>(
          create: (_) => InjectorContainer.getIt<GetPrKeyByIdBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Solicitud de Giro Relámpago',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(topPadding * 0.05),
          child: Column(
            children: [
              Text(
                'GIRO RELÁMPAGO',
                style: AppTextStyles.mainStyleGreen18Bold(context),
              ),
              Row(
                children: [
                  Text(
                    'Cuenta ORIGEN:\n'
                    'Saldo disponible:\n'
                    'Monto Envio:\n'
                    'CI DESTINATARIO:\n'
                    'DESTINATARIO:\n'
                    'Celular DESTINATARIO:\n'
                    'Existe cambio de moneda\n'
                    'Monto DÉBITO:\n'
                    'Monto comisión:\n'
                    'Monto Impuesto:\n'
                    'Monto total a debitar:',
                    style: AppTextStyles.mainStyleGreen14Bold(context),
                  ),
                  SizedBox(width: smallSpacing * 0.5),
                  Text(
                    '$cuentaOri\n'
                    '${res.data.savingBalance}\n'
                    '${res.data.amountReal}\n'
                    '$ciDesti\n'
                    '$desti\n'
                    '$celDesti\n'
                    '$cambioMo\n'
                    '$montoDebi\n'
                    '${res.data.amountCommision}\n'
                    '$montoImp\n'
                    '$montoTotalDebi',
                    style: AppTextStyles.mainStyleGreen14(context),
                  ),
                ],
              ),
              BlocConsumer<
                ProdemExpressSaveSolicitationBloc,
                ProdemExpressSaveSolicitationState
              >(
                listener: (context, state) {
                  if (state is ProdemExpressSaveSolicitationSuccess) {
                    InjectorContainer.getIt<AppRouter>().push(
                      SavingAccountTransMobileEndRoute(
                        response: state
                            .prodemExpressSaveSolicitationEntity
                            .reportString,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return ProdemKeySection(
                    smallSpacing: smallSpacing,
                    screenSize: screenSize,
                    onConfirm: () {
                      final createState = context.read<CreatePrKeyBloc>().state;

                      if (createState is CreatePrKeySuccess) {
                        final idSms = createState
                            .createProdemKeyResponseEntity
                            .data
                            .toString();

                        context.read<ProdemExpressSaveSolicitationBloc>().add(
                          ProdemExpressSaveSoliEvent(
                            amountTransaction: montoDebi,
                            beneficiaryCellphone: celDesti,
                            beneficiaryDI: ciDesti,
                            beneficiaryName: desti,
                            codeSavingAccountSource: cuentaOri,
                            idMoney: '1',
                            isNaturalClient: 'true',
                            reasonSolicitation: 'hola',

                            idSMSOperation: idSms,
                            prodemKeyCode:
                                context.read<GetPrKeyByIdBloc>().state
                                    is GetPrKeyByIdSuccess
                                ? (context.read<GetPrKeyByIdBloc>().state
                                              as GetPrKeyByIdSuccess)
                                          .getProdemKeyByIdResponseEntity
                                          ?.data ??
                                      ''
                                : '',
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
