import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/presentation/widget/drop.dart';
import 'package:app_prodem_v1/utils/time.dart';
import 'package:app_prodem_v1/modules/home/savingsAccountExtractDataTransactionable/presentation/bloc/saving_account_extrac_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/router/router.dart';
import '../../../../../presentation/widget/butoons_widget.dart';
import '../../../../../utils/text_util.dart';
import '../../../UserSessionInfo/presentation/bloc/bloc.dart';

@RoutePage()
class SavingAccountExtractDataTranSacreen extends StatefulWidget {
  final SavingAccountExtracBloc bloc;
  final SessionInfoBloc sessionBloc;
  const SavingAccountExtractDataTranSacreen({
    super.key,
    required this.bloc,
    required this.sessionBloc,
  });

  @override
  State<SavingAccountExtractDataTranSacreen> createState() =>
      _SavingAccountExtractDataTranSacreenState();
}

class _SavingAccountExtractDataTranSacreenState
    extends State<SavingAccountExtractDataTranSacreen> {
  String? _selectedAccount;
  String? _selectedAccountId;
  String? _selectedAccountMoneyId;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    //final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.bloc),
        BlocProvider.value(value: widget.sessionBloc),
      ],
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Últimos movimientos',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(topPadding * 0.05),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'CONSULTA DE SALDOS DE CUENTAS DE AHORRO',
                  style: AppTextStyles.mainStyleGreen18Bold(context),
                ),
                SizedBox(height: smallSpacing * 0.5),
                AccountDropdown(
                  selectedAccount: _selectedAccount,
                  smallSpacing: smallSpacing,
                  screenSize: screenSize,
                  onAccountSelected: (account) {
                    setState(() {
                      _selectedAccount = account.operationCode;
                      _selectedAccountId = account.idOperationEntity;
                      _selectedAccountMoneyId = account.idMoney;
                    });
                  },
                ),
                Butoon1(
                  onTap: () {
                    widget.bloc.add(
                      SavingAccountExEnevet(
                        codeSavingsAccount: _selectedAccount ?? '',
                      ),
                    );
                  },
                  lblTextField: 'CONSULTAR',
                ),
                SizedBox(height: smallSpacing * 0.5),
                BlocBuilder<SavingAccountExtracBloc, SavingAccountExtracState>(
                  builder: (context, state) {
                    if (state is SavingAccountExtracSuccess) {
                      final res = state.dataSavingAccountExtracEntity;
                      return Column(
                        children: [
                          Text(
                            'ULTIMOS MOVIMIENTOS:',
                            style: AppTextStyles.mainStyleGreen18Bold(context),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: screenSize.width * 0.3,
                                child: Text(
                                  'Fecha: \n'
                                  'Nro. de cuenta:\n'
                                  'Saldo:',
                                  textAlign: TextAlign.start,
                                  style: AppTextStyles.mainStyleGreen14Bold(
                                    context,
                                  ),
                                ),
                              ),
                              Text(
                                '${DateFormatter.formatDateTime(res.processDate)}\n'
                                '${res.codeSavingsAccount}\n'
                                '${res.accountBalance}',
                                textAlign: TextAlign.start,
                                style: AppTextStyles.mainStyleGreen14(context),
                              ),
                            ],
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: res.colDetailsMovemment.length,
                            itemBuilder: (BuildContext context, int index) {
                              final colDetailsM =
                                  res.colDetailsMovemment[index];
                              final date = DateTime.parse(
                                colDetailsM.dateTransaction.toString(),
                              );
                              return GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Detalle del Movimiento',
                                          style:
                                              AppTextStyles.mainStyleGreen18Bold(
                                                context,
                                              ),
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width:
                                                      screenSize.width * 0.23,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Fecha/Hora:\n'
                                                        'Transaccion:\n'
                                                        'Agencia:\n'
                                                        'Monto:\n'
                                                        'Saldo:',
                                                        style:
                                                            AppTextStyles.mainStyleGreen12Bold(
                                                              context,
                                                            ),
                                                      ),
                                                      Text(
                                                        'Referencia:',
                                                        style:
                                                            AppTextStyles.mainStyleGreen12Bold(
                                                              context,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      screenSize.width * 0.35,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${DateFormatter.formatDateTime(date)}\n'
                                                        '${colDetailsM.descriptionOperation}\n'
                                                        '${colDetailsM.officeTransaction}\n'
                                                        '${colDetailsM.amountBalance}\n'
                                                        '${colDetailsM.deposit}',
                                                        style:
                                                            AppTextStyles.mainStyleGreen12(
                                                              context,
                                                            ),
                                                      ),
                                                      Text(
                                                        colDetailsM.reference,
                                                        style:
                                                            AppTextStyles.mainStyleGreen12(
                                                              context,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Card(
                                  elevation: smallSpacing * 0.45,
                                  child: Padding(
                                    padding: EdgeInsets.all(topPadding * 0.05),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: screenSize.width * 0.65,
                                          child: Text(
                                            '${colDetailsM.dateTransaction}\n'
                                            '${colDetailsM.reference}',
                                            textAlign: TextAlign.start,
                                            style: AppTextStyles.mainStyle12(
                                              context,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${colDetailsM.deposit}\n'
                                          '${colDetailsM.officeTransaction}',
                                          textAlign: TextAlign.end,
                                          style: AppTextStyles.mainStyle12(
                                            context,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    }
                    return SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
