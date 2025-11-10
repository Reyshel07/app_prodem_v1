import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/dpf/verifica_plazo_renovacion/presentation/bloc/bloc/validate_and_save_renovation_dpf_bloc.dart';
import 'package:app_prodem_v1/modules/dpf/verifica_plazo_renovacion/presentation/bloc/bloc/verify_redeem_bloc.dart';
import 'package:app_prodem_v1/modules/dpf/verifica_plazo_renovacion/presentation/bloc/verifica_plazo_renovacion_bloc.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/create_pr_key_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/get_pr_key_by_id_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/drop.dart';
import 'package:app_prodem_v1/presentation/widget/prodem_key.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../InforAcciones/domain/entities/entity.dart';

@RoutePage()
class VerificaPlazoRenovacionScreen extends StatefulWidget {
  final String text;
  final SessionInfoBloc sessionBloc;
  final DpfExpiracionEntity? data;

  const VerificaPlazoRenovacionScreen({
    super.key,
    required this.text,
    required this.sessionBloc,
    required this.data,
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
          create: (_) => InjectorContainer.getIt<VerifyRedeemBloc>(),
        ),
        BlocProvider(
          create: (_) => InjectorContainer.getIt<VerificaPlazoRenovacionBloc>(),
        ),
        BlocProvider(
          create: (_) =>
              InjectorContainer.getIt<ValidateAndSaveRenovationDpfBloc>(),
        ),
        BlocProvider(create: (_) => InjectorContainer.getIt<CreatePrKeyBloc>()),
        BlocProvider(
          create: (_) => InjectorContainer.getIt<GetPrKeyByIdBloc>(),
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
        body: BlocBuilder<VerificaPlazoRenovacionBloc, VerificaPlazoRenovacionState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(topPadding * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cancelación - DPF',
                    style: AppTextStyles.mainStyleGreen16Bold(context),
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
                              style: AppTextStyles.mainStyleGreen14Bold(
                                context,
                              ),
                            ),
                            SizedBox(height: smallSpacing * 0.5),
                            Row(
                              children: [
                                Text(
                                  'Cod. DPF Expidado:\n'
                                  'Capital Bs:\n'
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
                                  '${widget.data?.codigoDpf}\n'
                                  '${widget.data?.monto}\n'
                                  '${widget.data?.interes}\n'
                                  '${widget.data?.impuestoCierre}\n'
                                  '${widget.data?.capitalARenovar}\n'
                                  '${widget.data?.termTxt}\n'
                                  '${widget.data?.dateExpirationtxt}\n'
                                  '${widget.data?.rateTxt}',
                                  style: AppTextStyles.mainStyleGreen14(
                                    context,
                                  ),
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
                  if (state is VerificaPlazoRenovacionSuccess) ...[
                    Text(
                      'Confirmar los datos del DPF',
                      style: AppTextStyles.mainStyleGreen14Bold(context),
                    ),
                    TextFromFiel02(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      userController: TextEditingController(
                        text: widget.data?.dateExpirationtxt,
                      ),
                      lbText: 'Fecha de cancelación',
                    ),
                  ],
                  Text(
                    'Monto a depositar a la cuenta',
                    style: AppTextStyles.mainStyleGreen14Bold(context),
                  ),

                  AccountDropdown(
                    selectedAccount: _selectedAccount,
                    smallSpacing: smallSpacing,
                    screenSize: screenSize,
                    onAccountSelected: (account) {
                      setState(() => _selectedAccount = account.operationCode);
                    },
                  ),

                  TextFromFiel02(
                    screenSize: screenSize,
                    smallSpacing: smallSpacing,
                    userController: amountController,
                    lbText: 'Monto a cuenta:',
                  ),

                  if (state is! VerificaPlazoRenovacionSuccess) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocConsumer<VerifyRedeemBloc, VerifyRedeemState>(
                          listener: (context, state) {
                            if (state is VerifyRedeemSuccess) {
                              showDialog(
                                context: context,
                                builder: (dialogContext) => AlertDialog(
                                  content: Text(
                                    state.data.data.info,
                                    style: AppTextStyles.mainStyleGreen14Bold(
                                      context,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(dialogContext).pop(),
                                      child: Text(
                                        'No',
                                        style:
                                            AppTextStyles.mainStyleGreen14Bold(
                                              context,
                                            ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context
                                            .read<VerificaPlazoRenovacionBloc>()
                                            .add(
                                              VerificaPlazoRenoEvent(
                                                termInDays:
                                                    '${widget.data?.termTxt?.split(" ").first}',
                                                idDpfOffice:
                                                    '${widget.data?.idOffice}',
                                              ),
                                            );

                                        Navigator.of(dialogContext).pop();
                                      },
                                      child: Text(
                                        'SI',
                                        style:
                                            AppTextStyles.mainStyleGreen14Bold(
                                              context,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            return Butoon1(
                              onTap: () {
                                context.read<VerifyRedeemBloc>().add(
                                  VerifyRedEvent(
                                    term: widget.data?.termTxt
                                        ?.split(" ")
                                        .first,
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
                  if (state is VerificaPlazoRenovacionSuccess) ...[
                    BlocConsumer<
                      ValidateAndSaveRenovationDpfBloc,
                      ValidateAndSaveRenovationDpfState
                    >(
                      listener: (context, state) {
                        if (state is ValidateAndSaveRenovationDpfSuccess) {
                          InjectorContainer.getIt<AppRouter>().push(
                            SavingAccountTransMobileEndRoute(
                              response: state
                                  .validateAndSaveRenovationDpfResponseEntity
                                  .data,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is ValidateAndSaveRenovationDpfLoading) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                  color: Theme.of(context).colorScheme.green,
                                ),
                                SizedBox(height: smallSpacing),
                                Text(
                                  'Procesando tu solicitud...',
                                  style: AppTextStyles.mainStyleGreen14Bold(
                                    context,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return ProdemKeySection(
                          smallSpacing: smallSpacing,
                          screenSize: screenSize,
                          onConfirm: () {
                            final createState = context
                                .read<CreatePrKeyBloc>()
                                .state;

                            if (createState is CreatePrKeySuccess) {
                              final idSms = createState
                                  .createProdemKeyResponseEntity
                                  .data
                                  .toString();
                              context.read<ValidateAndSaveRenovationDpfBloc>().add(
                                ValidateAndSaveRenoDpfEvent(
                                  idRenovationDPF: '0',
                                  idcDPFMFInitial: "63103875881064441",
                                  idcDPFMFNew: "0",
                                  idcOperationType: "600085",
                                  cellPhone: "70521850",
                                  email: "Xsusimeavebustillo@gmail.comX",
                                  idDpfOffice: '63',
                                  amount: '64774.0',
                                  termInDays: '0',
                                  rate: '0.0',
                                  interestEarned: '0.0',
                                  finalAmount: '64774.0',
                                  originResources: "",
                                  idcState: '0',
                                  contextData: "",
                                  solicitationDate: "2025-11-10T12:08:04-04:00",
                                  idMoney: '1',
                                  fullName: "ROBLES VISCARRA SANDRO SIXTO",
                                  idSavingsAccount: "17151629734483090",
                                  codeSMS: "725966",
                                  withProdemKey: true,
                                  isDpfEmployee: false,
                                  codeSavingAccount: "117-2-1-17506-8",
                                  idcOperationTypeAUX: '89',
                                  idcInfoType: '0',
                                  isAnotherAccount: false,
                                  amountOnAccount: '64774.0',
                                  oldAmount: '60000.0',
                                  interestAmountOld: '4774.0',
                                  capitalRenew: '64774.0',
                                  renewalTax: '0.0',
                                  closingTax: '0.0',
                                  idDepositProduct: '1',
                                  depositProduct: "",
                                  hashTracking:
                                      "11e42132-e1e0-4b2d-a384-a6ac8a8ecad1",
                                  isPignorado: false,
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
