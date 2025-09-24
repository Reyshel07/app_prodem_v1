import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/transfer_between_accounts/GetSavingAccountData/presentation/bloc/saving_account_data_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../../config/router/router.dart';
import '../../../../../utils/text.dart';
import '../../../../home/UserSessionInfo/presentation/bloc/bloc.dart';

@RoutePage()
class TransferToAThirdPartyAccountScreen extends StatefulWidget {
  final SavingAccountDataBloc bloc;
  final SessionInfoBloc sessionBloc;
  const TransferToAThirdPartyAccountScreen({
    super.key,
    required this.bloc,
    required this.sessionBloc,
  });

  @override
  State<TransferToAThirdPartyAccountScreen> createState() =>
      _TransferToAThirdPartyAccountState();
}

class _TransferToAThirdPartyAccountState
    extends State<TransferToAThirdPartyAccountScreen> {
  final TextEditingController transactionAmountController =
      TextEditingController(text: '45');
  final TextEditingController observationController = TextEditingController(
    text: 'deposito',
  );
  final TextEditingController destinationAccountController =
      TextEditingController(text: '117-2-1-17513-0');
  String? _selectedValue;
  String? _codeSavingAccount;
  String? _codeSavingAccountSource;
  List<String> listMoney1 = ['BS', 'SUS'];
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
            'Transferencia a Cuentas de Terceros',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: BlocBuilder<SessionInfoBloc, SessionInfoState>(
          builder: (context, state) {
            if (state is SessionInfoSuccess) {
              final listAccounts =
                  state.userInfoResponseEnttity.listCodeSavingsAccount;
              // listAccounts[0].operationCode
              final list = listAccounts
                  .map((account) => account.operationCode)
                  .toList();
              //final listMoney = listAccounts.map((account) => account.codMoney);
              return Padding(
                padding: EdgeInsets.all(topPadding * 0.05),
                child: Column(
                  children: [
                    Text(
                      'TRANSFERENCIA A TERCEROS:',
                      style: AppTextStyles.mainStyleGreen16Bold(context),
                    ),
                    SizedBox(
                      child: Card(
                        elevation: smallSpacing * 0.5,
                        child: Container(
                          width: double.infinity,
                          height: smallSpacing * 3,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.green,
                            ),
                            borderRadius: BorderRadius.all(radiusCircular(11)),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            underline: const SizedBox(),
                            padding: EdgeInsetsGeometry.all(smallSpacing * 0.5),
                            hint: Text(
                              'CUENTA AHORRO ORIGEN',
                              style: AppTextStyles.mainStyleGreen14Bold(
                                context,
                              ),
                            ),
                            value: _codeSavingAccountSource,
                            items: list.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _codeSavingAccountSource = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Card(
                        elevation: smallSpacing * 0.5,
                        child: Container(
                          width: double.infinity,
                          height: smallSpacing * 3,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.green,
                            ),
                            borderRadius: BorderRadius.all(radiusCircular(11)),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            underline: const SizedBox(),
                            padding: EdgeInsetsGeometry.all(smallSpacing * 0.5),
                            hint: Text(
                              'MONEDA TRANSFERENCIA',
                              style: AppTextStyles.mainStyleGreen14Bold(
                                context,
                              ),
                            ),
                            value: _selectedValue,
                            items: listMoney1.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedValue = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    TextFromFiel02(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      userController: transactionAmountController,
                      lbText: 'MONTO TRANSACCION',
                    ),
                    TextFromFiel02(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      userController: destinationAccountController,
                      lbText: 'Cuenta AHORRO DESTINO',
                    ),
                    TextFromFiel02(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      userController: observationController,
                      lbText: 'DIGITE ALGUNA OBSERVACIÓNQ',
                    ),
                    SizedBox(height: smallSpacing * 0.5),
                    Text(
                      'Los datos que se validaran para procesar la transferencia de fondos son el numero de cuenta del beneficiario y el nombre de la Entidad Financiera Destinataria, por lo que es responsabilidad del ordenante verificar dichos datos.',
                      style: AppTextStyles.mainStyleRed10Bold(context),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: smallSpacing * 0.5),
                    SizedBox(
                      width: screenSize.width * 0.4,
                      child: Card(
                        elevation: smallSpacing * 0.5,
                        child:
                            BlocConsumer<
                              SavingAccountDataBloc,
                              SavingAccountDataState
                            >(
                              listener: (context, state) {
                                if (state is SavingAccountDataSuccess) {
                                  final res = state.dataSavingAccountEntity;
                                  InjectorContainer.getIt<AppRouter>().push(
                                    TransferFeesTwoRoute(
                                      cuentaD: _codeSavingAccountSource ?? '',
                                      cuentaO: _codeSavingAccount ?? '',
                                      monto: transactionAmountController.text,
                                      titulares: res.colHolders.toList(),
                                      saldo: res.savingBalance.toString(),
                                    ),
                                  );
                                }
                              },
                              builder: (context, state) {
                                return Butoon1(
                                  onTap: () {
                                    int idMoneyOperation = 1;
                                    String amountOperation =
                                        transactionAmountController.text;
                                    String codeSavingAccountSource1 =
                                        _codeSavingAccountSource ??
                                        '117-2-1-17512-5';
                                    String codeSavingAccount1 =
                                        _codeSavingAccount ?? '117-2-1-17513-0';
                                    widget.bloc.add(
                                      SavingAccountDEvent(
                                        codeSavingAccountSource:
                                            codeSavingAccountSource1,
                                        codeSavingAccount: codeSavingAccount1,
                                        amountOperation: amountOperation,
                                        idMoneyOperation: idMoneyOperation,
                                      ),
                                    );
                                  },
                                  lblTextField: 'CONTINUAR',
                                );
                              },
                            ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
