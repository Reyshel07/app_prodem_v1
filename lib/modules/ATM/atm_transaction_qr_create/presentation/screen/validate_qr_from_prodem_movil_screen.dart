import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/ATM/atm_transaction_qr_create/presentation/bloc/atm_transaction_qr_create_bloc.dart';
import 'package:app_prodem_v1/modules/ATM/validate_qr_from_prodem_movil/domain/entities/validate_qr_from_prodem_entity.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/create_pr_key_bloc.dart';
import 'package:app_prodem_v1/modules/key_pr/presentation/bloc/get_pr_key_by_id_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/drop.dart';
import 'package:app_prodem_v1/presentation/widget/prodem_key.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ValidateQRfromProdemMovilTwoScreen extends StatefulWidget {
  final SessionInfoBloc sessionBloc;
  final ValidateQrFromProdemMovilResponseEntity res;
  final String qRGenerated;
  const ValidateQRfromProdemMovilTwoScreen({
    super.key,
    required this.sessionBloc,
    required this.res,
    required this.qRGenerated,
  });

  @override
  State<ValidateQRfromProdemMovilTwoScreen> createState() =>
      _ValidateQRfromProdemMovilTwoScreenState();
}

class _ValidateQRfromProdemMovilTwoScreenState
    extends State<ValidateQRfromProdemMovilTwoScreen> {
  final TextEditingController amountController = TextEditingController(
    text: '45',
  );

  String? _selectedAccount;
  String? idOperationEntity;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    //final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.sessionBloc),
        //BlocProvider(create: (context)=> InjectorContainer.getIt<>())
        BlocProvider(
          create: (context) =>
              InjectorContainer.getIt<AtmTransactionQrCreateBloc>(),
        ),
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
            'Consulta de Saldos',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(topPadding * 0.05),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'QR ID:\n'
                    'ATM:',
                  ),
                  Text(
                    '${widget.res.data.qRuuid}\n'
                    '${widget.res.data.atmName}',
                  ),
                ],
              ),
              AccountDropdown(
                selectedAccount: _selectedAccount,
                smallSpacing: smallSpacing,
                screenSize: screenSize,
                onAccountSelected: (account) {
                  setState(() {
                    _selectedAccount = account.operationCode;
                    idOperationEntity = account.idOperationEntity;
                  });
                },
              ),
              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: TextEditingController(text: 'BS'),
                lbText: 'Moneda:',
              ),
              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: TextEditingController(
                  text: widget.res.data.colCuts.toString(),
                ),
                lbText: 'Cortes disponibles en el ATM:',
              ),
              TextFromFiel02(
                screenSize: screenSize,
                smallSpacing: smallSpacing,
                userController: amountController,
                lbText: 'Monto a retirar en ATM:',
              ),
              BlocConsumer<
                AtmTransactionQrCreateBloc,
                AtmTransactionQrCreateState
              >(
                listener: (context, state) {
                  if (state is AtmTransactionQrCreateSuccess) {}
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

                        context.read<AtmTransactionQrCreateBloc>().add(
                          AtmTansactionQrCreEvent(
                            aTMTransactionCode: widget.res.data.idTransactionAtm
                                .toString(),
                            amountWithdrawn: amountController.text,
                            deviceIdentifier: "c0556d3b362470ac",
                            idATMEntity: widget.res.data.idAtm.toString(),
                            idSavingAccount: idOperationEntity ?? '',
                            qRGenerated: widget.qRGenerated,
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
