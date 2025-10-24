import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_banks_list/presentation/bloc/get_ach_banck_bloc.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/bloc.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_data/presentation/bloc/get_ach_data_bloc.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_valid_account/presentation/bloc/get_valid_account_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/drop.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../utils/text.dart';

@RoutePage()
class GetAchBanckListScreen extends StatefulWidget {
  final GetAchBanckBloc bloc;
  final SessionInfoBloc sessionBloc;
  const GetAchBanckListScreen({
    super.key,
    required this.bloc,
    required this.sessionBloc,
  });

  @override
  State<GetAchBanckListScreen> createState() => _GetAchBanckListScreenState();
}

class _GetAchBanckListScreenState extends State<GetAchBanckListScreen> {
  final TextEditingController amountToSendController = TextEditingController(
    text: '117',
  );
  final TextEditingController recipientsAccountController =
      TextEditingController(text: '3061495151');
  final TextEditingController destinationAccountController =
      TextEditingController(text: 'Jade rashel piza quispe');
  final TextEditingController recipientController = TextEditingController(
    text: '9151549',
  );
  final TextEditingController reasonForTransferController =
      TextEditingController(text: 'pago');

  String? _selectedValueMoney;
  List<String> listMoney1 = ['BS', 'SUS'];
  bool isChecked = false;
  int? _selectedBankId;
  String? _selectedValueBankName;
  String? _selectedAccount;
  String? _selectedAccountId;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.bloc),
        BlocProvider.value(value: widget.sessionBloc),
        BlocProvider(
          create: (context) => InjectorContainer.getIt<GetValidAccountBloc>(),
        ),
        BlocProvider(
          create: (context) => InjectorContainer.getIt<GetAchDataBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Transferencia a otros bancos',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: BlocBuilder<GetAchBanckBloc, GetAchBanckState>(
          builder: (context, state) {
            if (state is GetAchBanckSuccess) {
              final res = state.getAchBanksListResponseEntity;
              final nameList = res.data.colBanks
                  .map((account) => account.bank)
                  .toList();

              return ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(topPadding * 0.05),
                    child: Column(
                      children: [
                        Text(
                          'TRANSFERENCIA A OTROS BANCOS:',
                          style: AppTextStyles.mainStyleGreen18Bold(context),
                        ),
                        Column(
                          children: [
                            ///cuenta origen
                            AccountDropdown(
                              selectedAccount: _selectedAccount,
                              smallSpacing: smallSpacing,
                              screenSize: screenSize,
                              onAccountSelected: (account) {
                                setState(() {
                                  _selectedAccount = account.operationCode;
                                  _selectedAccountId =
                                      account.idOperationEntity;
                                  //_idSavingsAccount = account.idOperationEntity;
                                });
                              },
                            ),
                            _buildDropdown(
                              title: 'MONEDA TRANSFERENCIA',
                              items: listMoney1,
                              value: _selectedValueMoney,
                              onChanged: (newValue) {
                                setState(() => _selectedValueMoney = newValue);
                              },
                              smallSpacing: smallSpacing,
                            ),
                            TextFromFiel02(
                              screenSize: screenSize,
                              smallSpacing: smallSpacing,
                              userController: amountToSendController,
                              lbText: 'Monto a enviar:',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() => isChecked = value ?? false);
                              },
                            ),
                            Text(
                              'Elegir de mis cuentas favoritas',
                              style: AppTextStyles.mainStyleGreen14Bold(
                                context,
                              ),
                            ),
                          ],
                        ),
                        _buildDropdown(
                          title: 'Banco DESTINO',
                          items: nameList,
                          value: _selectedValueBankName,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedValueBankName = newValue;

                              final selectedBank = res.data.colBanks.firstWhere(
                                (bank) => bank.bank == newValue,
                              );
                              _selectedBankId = selectedBank.idBank;
                            });
                          },
                          smallSpacing: smallSpacing,
                        ),
                        TextFromFiel02(
                          screenSize: screenSize,
                          smallSpacing: smallSpacing,
                          userController: recipientsAccountController,
                          lbText: 'Cuenta del DESTINATARIO(Banco Destino):',
                        ),
                        TextFromFiel02(
                          screenSize: screenSize,
                          smallSpacing: smallSpacing,
                          userController: destinationAccountController,
                          lbText: 'Nombre del DESTINATARIO:',
                        ),
                        TextFromFiel02(
                          screenSize: screenSize,
                          smallSpacing: smallSpacing,
                          userController: recipientController,
                          lbText: 'Nro. Doc/NIT destinatario:',
                        ),
                        TextFromFiel02(
                          screenSize: screenSize,
                          smallSpacing: smallSpacing,
                          userController: reasonForTransferController,
                          lbText: 'Motivo de la transferencia:',
                        ),
                        Text(
                          'Los datos que se validarán para procesar la transferencia de fondos son el numero de cuenta el beneficiario y el nombre de la Entidad Financiera Destinataria, por lo que es responsabilidad del ordenante verificar dicho datos.',
                          textAlign: TextAlign.justify,
                          style: AppTextStyles.mainStyleRed10Bold(context),
                        ),
                        BlocConsumer<GetValidAccountBloc, GetValidAccountState>(
                          listener: (context, state) {
                            if (state is GetValidAccountSuccess) {
                              showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return BlocProvider.value(
                                    value: context.read<GetAchDataBloc>(),
                                    child: AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'La transferencia de fondos será abonada a la cuenta ${recipientsAccountController.text} de $_selectedValueBankName, del beneficiario que se registró. Una vez realizada, esta no podrá ser revertida.',
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                  dialogContext,
                                                ),
                                                child: Text(
                                                  'CANCELAR',
                                                  style:
                                                      AppTextStyles.mainStyleGreen12Bold(
                                                        context,
                                                      ),
                                                ),
                                              ),
                                              BlocConsumer<
                                                GetAchDataBloc,
                                                GetAchDataState
                                              >(
                                                listener: (context, state) {
                                                  if (state
                                                      is GetAchDataSuccess) {
                                                    final res = state
                                                        .getAchDataResponseEntity;
                                                    InjectorContainer.getIt<AppRouter>().push(
                                                      GetAchDataRoute(
                                                        cambioM: '0',
                                                        cuentaDes:
                                                            recipientsAccountController
                                                                .text,
                                                        cuentaO:
                                                            _selectedAccount ??
                                                            '',
                                                        mComision: res
                                                            .data
                                                            .amountCommision
                                                            .toString(),
                                                        montoDev: res
                                                            .data
                                                            .amountReal
                                                            .toString(),
                                                        montoEn: res
                                                            .data
                                                            .amountReal
                                                            .toString(),
                                                        montoIm: res
                                                            .data
                                                            .amountCommision
                                                            .toString(),
                                                        montoTotal: res
                                                            .data
                                                            .amountMaxLip
                                                            .toString(),
                                                        motivoEn:
                                                            reasonForTransferController
                                                                .text,
                                                        nit: recipientController
                                                            .text,
                                                        nombreDes:
                                                            destinationAccountController
                                                                .text,
                                                        bancoDes:
                                                            _selectedValueBankName ??
                                                            '',
                                                        idBankDestiny:
                                                            _selectedBankId
                                                                .toString(),
                                                        saldoDispo: res
                                                            .data
                                                            .savingBalance
                                                            .toString(),
                                                        idCuentaEnvio:
                                                            _selectedAccountId ??
                                                            '',
                                                      ),
                                                    );
                                                  }
                                                },
                                                builder: (context, state) {
                                                  return TextButton(
                                                    onPressed: () {
                                                      context
                                                          .read<
                                                            GetAchDataBloc
                                                          >()
                                                          .add(
                                                            GetAchDaEvent(
                                                              amountTransaction:
                                                                  amountToSendController
                                                                      .text,
                                                              idMoney: '1',
                                                              idSavingsAccount:
                                                                  _selectedAccountId ??
                                                                  '',
                                                              isNaturalClient:
                                                                  true,
                                                            ),
                                                          );
                                                    },
                                                    child: Text(
                                                      'CONFIRMAR',
                                                      style:
                                                          AppTextStyles.mainStyleGreen12Bold(
                                                            context,
                                                          ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          builder: (context, state) {
                            return Butoon1(
                              onTap: () {
                                String accountNumber =
                                    recipientsAccountController.text;
                                if (_selectedBankId == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Debe seleccionar un banco destino",
                                      ),
                                    ),
                                  );
                                  return;
                                }
                                String idbank = _selectedBankId.toString();
                                context.read<GetValidAccountBloc>().add(
                                  GetValidAEvent(
                                    accountNumber: accountNumber,
                                    idbank: idbank,
                                  ),
                                );
                              },
                              lblTextField: 'CONTINUAR',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String title,
    required List<String> items,
    required String? value,
    required void Function(String?) onChanged,
    required double smallSpacing,
  }) {
    return SizedBox(
      child: Card(
        elevation: smallSpacing * 0.5,
        child: Container(
          width: double.infinity,
          height: smallSpacing * 3,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.green),
            borderRadius: BorderRadius.all(radiusCircular(11)),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            underline: const SizedBox(),
            padding: EdgeInsetsGeometry.all(smallSpacing * 0.5),
            hint: Text(
              title,
              style: AppTextStyles.mainStyleGreen14Bold(context),
            ),
            value: value,
            items: items
                .map((val) => DropdownMenuItem(value: val, child: Text(val)))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
