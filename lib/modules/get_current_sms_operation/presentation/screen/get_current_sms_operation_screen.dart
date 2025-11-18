import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/get_current_sms_operation/presentation/bloc/get_current_sms_operation_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeline_tile/timeline_tile.dart';

@RoutePage()
class GetCurrentSmsOperationScreen extends StatefulWidget {
  const GetCurrentSmsOperationScreen({super.key});

  @override
  State<GetCurrentSmsOperationScreen> createState() =>
      _GetCurrentSmsOperationScreenState();
}

class _GetCurrentSmsOperationScreenState
    extends State<GetCurrentSmsOperationScreen> {
  bool showGeneratedCode = false; // <-- NUEVA VARIABLE

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;

    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<GetCurrentSmsOperationBloc>()
            ..add(GetCurrentSmsOperaEvent()),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'CódigoPR',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
          actions: [
            BlocBuilder<
              GetCurrentSmsOperationBloc,
              GetCurrentSmsOperationState
            >(
              builder: (context, state) {
                final isLoading = state is GetCurrentSmsOperationLoading;
                return IconButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          context.read<GetCurrentSmsOperationBloc>().add(
                            GetCurrentSmsOperaEvent(),
                          );
                        },
                  icon: isLoading
                      ? SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Icon(Icons.refresh),
                );
              },
            ),
            IconButton(
              onPressed: () {
                final state = context.read<GetCurrentSmsOperationBloc>().state;

                if (state is GetCurrentSmsOperationSuccess &&
                    showGeneratedCode) {
                  final data = state.getCurrentSmsOperationResponseEntity.data;

                  Clipboard.setData(
                    ClipboardData(text: data.idSmsOperacion.toString()),
                  );

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Código copiado")));
                }
              },
              icon: Icon(Icons.copy),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app)),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(topPadding * 0.05),
          child: Column(
            children: [
              Text(
                'Código transaccional',
                style: AppTextStyles.mainStyleGreen14Bold(context),
              ),
              SizedBox(height: smallSpacing * 0.5),

              Expanded(
                child:
                    BlocConsumer<
                      GetCurrentSmsOperationBloc,
                      GetCurrentSmsOperationState
                    >(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is GetCurrentSmsOperationLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state is GetCurrentSmsOperationSuccess) {
                          final data =
                              state.getCurrentSmsOperationResponseEntity.data;
                          final detail = data.transactionDetail;

                          return SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.all(topPadding * 0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (showGeneratedCode) ...[
                                    Text(
                                      data.idSmsOperacion.toString(),
                                      style: AppTextStyles.mainStyleGreen16Bold(
                                        context,
                                      ),
                                    ),
                                    TimelineTile(
                                      alignment: TimelineAlign.manual,
                                      lineXY: 0.1,
                                      indicatorStyle: IndicatorStyle(
                                        width: 20,
                                        color: Colors.green,
                                      ),
                                      beforeLineStyle: LineStyle(
                                        color: Colors.green,
                                        thickness: 3,
                                      ),
                                      /*endChild: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Cuenta Origen: 117-2-1-17506-8",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),*/
                                    ),

                                    Text(
                                      'El código de confirmacion será asociado a la siguiente operación:',
                                      style: AppTextStyles.mainStyleGreen12(
                                        context,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                  if (!showGeneratedCode)
                                    Text(
                                      'Si usted no está realizando esta transacción no genere el código y comuníquese con la línia gratuita 800-10-9797',
                                      style: AppTextStyles.mainStyleBlack14(
                                        context,
                                      ),
                                    ),

                                  SizedBox(height: 20),
                                  Text(
                                    detail.replaceAll('\r\n', '\n'),
                                    style: const TextStyle(fontSize: 16),
                                  ),

                                  SizedBox(height: 20),
                                  Butoon1(
                                    onTap: () {
                                      setState(() {
                                        showGeneratedCode = true;
                                      });
                                    },
                                    lblTextField: 'GENERAR CÓDIGO',
                                  ),
                                ],
                              ),
                            ),
                          );
                        }

                        if (state is GetCurrentSmsOperationError) {
                          return Center(child: Text(state.message));
                        }

                        return SizedBox.shrink();
                      },
                    ),
              ),
              Text(
                'El código solicitado debe ser utilizado únicamente para confirmar transacciones realizadas en prnet.pr.bo\n'
                'El Banco nunca solicitará códigos transaccionales durante el proceso de autenticación para verificar su identidad.\n'
                'Los códigos transaccionales no debe ser compartido por ningún medio de comunicación a terceros.\n  '
                'Siempre debe ingresar a PRNet desde www.pr.bo El Banco no envía accesos directos por ningún medio de comunicación.',
                style: AppTextStyles.mainStyleGreen12(context),
                textAlign: TextAlign.justify,
              ),

              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
