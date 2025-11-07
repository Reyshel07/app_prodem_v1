import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/dpf/InforAcciones/domain/entities/infor_acciones_entity.dart';
import 'package:app_prodem_v1/modules/dpf/verifica_plazo_renovacion/presentation/bloc/verifica_plazo_renovacion_bloc.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/drop.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class VerificaPlazoRenovacionScreen extends StatefulWidget {
  final String text;
  final SessionInfoBloc sessionBloc;
  final String codDpfExpidado;
  final String capital;
  final String interes;
  final String impuestoDeCierre;
  final String montoTotalCierre;
  final String plazo;
  final String fechaVencimiento;
  final String tasa;
  const VerificaPlazoRenovacionScreen({
    super.key,
    required this.text,
    required this.sessionBloc,
    required this.codDpfExpidado,
    required this.capital,
    required this.interes,
    required this.impuestoDeCierre,
    required this.montoTotalCierre,
    required this.plazo,
    required this.fechaVencimiento,
    required this.tasa,
  });

  @override
  State<VerificaPlazoRenovacionScreen> createState() =>
      _VerificaPlazoRenovacionScreenState();
}

class _VerificaPlazoRenovacionScreenState
    extends State<VerificaPlazoRenovacionScreen> {
  final TextEditingController emailController = TextEditingController(
    text: '71579864jp@gmail.com',
  );
  final TextEditingController amountController = TextEditingController(
    text: '58',
  );
  String? _selectedAccount;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.sessionBloc),
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<VerificaPlazoRenovacionBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            widget.text,
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(topPadding * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cancelación - DPF',
                style: AppTextStyles.mainStyleGreen14Bold(context),
              ),
              Card(
                elevation: smallSpacing * 0.5,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.green,
                    ),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(topPadding * 0.05),
                    child: Column(
                      children: [
                        Text(
                          'Datos del dpf a cancelar',
                          style: AppTextStyles.mainStyleGreen14Bold(context),
                        ),
                        SizedBox(height: smallSpacing * 0.5),
                        Row(
                          children: [
                            Text(
                              'Cod. DPF Expidado:\n'
                              'Capital Bs\n'
                              'Interés:\n'
                              'Impuesto de Cierre:\n'
                              'Monto Total de Cierre:\n'
                              'Plazo:\n'
                              'Fecha vencimiento:\n'
                              'Tasa:',
                              style: AppTextStyles.mainStyleGreen14Bold(
                                context,
                              ),
                            ),
                            SizedBox(width: smallSpacing * 0.5),
                            Text(
                              'Cod. DPF Expidado:\n'
                              'Capital Bs\n'
                              'Interés:\n'
                              'Impuesto de Cierre:\n'
                              'Monto Total de Cierre:\n'
                              'Plazo:\n'
                              'Fecha vencimiento:\n'
                              'Tasa:',
                              style: AppTextStyles.mainStyleGreen14(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: emailController,
                lbText: 'Correo electrónico:',
              ),
              Text(
                'Monto a depositr a la cuenta',
                style: AppTextStyles.mainStyleGreen14Bold(context),
              ),
              AccountDropdown(
                selectedAccount: _selectedAccount,
                smallSpacing: smallSpacing,
                screenSize: screenSize,
                onAccountSelected: (account) {
                  setState(() {
                    _selectedAccount = account.operationCode;
                  });
                },
              ),
              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: emailController,
                lbText: 'Monto a cuenta:',
              ),
              Row(
                children: [
                  BlocConsumer<
                    VerificaPlazoRenovacionBloc,
                    VerificaPlazoRenovacionState
                  >(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Butoon1(
                        onTap: () {
                          context.read<VerificaPlazoRenovacionBloc>().add(
                            VerificaPlazoRenoEvent(
                              idDpfOffice: '',
                              termInDays: '',
                            ),
                          );
                        },
                        lblTextField: 'CONTINUAR',
                      );
                    },
                  ),
                  Butoon1(onTap: () {}, lblTextField: 'CANCELAR'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
