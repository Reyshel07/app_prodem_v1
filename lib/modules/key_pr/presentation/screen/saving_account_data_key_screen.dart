import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/create_pr_key_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/get_pr_key_by_id_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/router/router.dart';

@RoutePage()
class TransferFeesTwoScreen extends StatelessWidget {
  final String? cuentaO;
  final String? saldo;
  final String? monto;
  final String? transferencia;
  final String? cuentaD;
  final String? titulares;
  const TransferFeesTwoScreen({
    super.key,
    required this.cuentaO,
    required this.cuentaD,
    required this.monto,
    required this.saldo,
    required this.titulares,
    required this.transferencia,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    //final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InjectorContainer.getIt<CreatePrKeyBloc>(),
        ),
        BlocProvider(
          create: (contex) => InjectorContainer.getIt<GetPrKeyByIdBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Transferencia entre cuentas propias',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(topPadding * 0.05),
          child: Column(
            children: [
              Text(
                'TRANSFERENCIA ENTRE CUENTAS PROPIAS',
                style: AppTextStyles.mainStyleGreen18Bold(context),
              ),
              SizedBox(height: smallSpacing * 0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Cuenta ORIGEN:\n'
                    'Saldodisponible:\n'
                    'Monto\n'
                    'Transferencia:\n'
                    'Cuenta DESTINO:\n'
                    'Titulares destino:\n'
                    'Existe cambio de moneda:',
                    style: AppTextStyles.mainStyleGreen14Bold(context),
                  ),
                  SizedBox(width: smallSpacing * 0.5),
                  Text(
                    '$cuentaO\n$saldo\n$monto\n$transferencia\n$cuentaD\n$titulares\n no',
                    textAlign: TextAlign.start,
                    style: AppTextStyles.mainStyleGreen14(context),
                  ),
                ],
              ),
              SizedBox(height: smallSpacing * 0.5),
              Text(
                'CÓDIGO PRODEM',
                style: AppTextStyles.mainStyleGreen18Bold(context),
              ),
              SizedBox(height: smallSpacing * 0.5),
              BlocBuilder<CreatePrKeyBloc, CreatePrKeyState>(
                builder: (context, state) {
                  return SizedBox(
                    width: screenSize.width * 0.4,
                    child: Card(
                      elevation: smallSpacing * 0.5,
                      child: Butoon1(
                        onTap: () {
                          context.read<CreatePrKeyBloc>().add(
                            CreatePrKeyEvent1(),
                          );
                        },
                        lblTextField: 'CÓDIGO PRODEM',
                      ),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<GetPrKeyByIdBloc, GetPrKeyByIdState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: screenSize.width * 0.3,
                        child: Card(
                          elevation: smallSpacing * 0.5,
                          child: Butoon1(
                            onTap: () {
                              context.read<GetPrKeyByIdBloc>().add(
                                GetPrKeyEvent(idSmsOperation: ''),
                              );
                            },
                            lblTextField: 'CONFIRMAR',
                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(
                    width: screenSize.width * 0.3,
                    child: Card(
                      elevation: smallSpacing * 0.5,
                      child: Butoon1(onTap: () {}, lblTextField: 'CANCELAR'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
