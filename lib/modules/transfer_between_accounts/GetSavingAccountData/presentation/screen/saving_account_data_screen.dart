import 'package:app_prodem_v1/config/router/app_router.gr.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/transfer_between_accounts/GetSavingAccountData/presentation/bloc/saving_account_data_bloc.dart';
import 'package:app_prodem_v1/presentation/screen/Register/account_settings_screen.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../../config/router/router.dart';
import '../../../../../utils/text.dart';
import '../../../../home/UserSessionInfo/presentation/bloc/bloc.dart';

@RoutePage()
class SavingAccountDataScreen extends StatefulWidget {
  final SavingAccountDataBloc bloc;
  final SessionInfoBloc sessionBloc;
  const SavingAccountDataScreen({
    super.key,
    required this.bloc,
    required this.sessionBloc,
  });

  @override
  State<SavingAccountDataScreen> createState() =>
      _SavingAccountDataScreenState();
}

class _SavingAccountDataScreenState extends State<SavingAccountDataScreen> {
  final TextEditingController transactionAmountController =
      TextEditingController();
  final TextEditingController observationController = TextEditingController(
    text: 'deposito',
  );
  String? _selectedValue;
  String? _codeSavingAccount;
  String? _codeSavingAccountSource;
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
            'Transferencia entre cuentas propias',
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
              final listMoney = listAccounts.map((account) => account.codMoney);
              return Padding(
                padding: EdgeInsets.all(topPadding * 0.05),
                child: Column(
                  children: [
                    Text(
                      'TRANSFERENCIA ENTRE CUENTAS PROPIAS:',
                      style: AppTextStyles.mainStyleGreen16Bold(context),
                    ),
                    /*DrowpButoon2(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      selectedValue: _codeSavingAccountSource,
                      list: list,
                      text: 'CUENTA AHORRO ORIGEN',
                    ),*/
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
                    /*DrowpButoon2(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      selectedValue: _selectedValue,
                      list: list,
                      text: 'MONEDA TRANSFERENCIA',
                    ),*/
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
                            items: listMoney.map((String value) {
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
                    /*DrowpButoon2(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      selectedValue: _codeSavingAccount,
                      list: list,
                      text: 'CUENTA AHORRO DESTINO',
                    ),*/
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
                              'CUENTA AHORRO DESTINO',
                              style: AppTextStyles.mainStyleGreen14Bold(
                                context,
                              ),
                            ),
                            value: _codeSavingAccount,
                            items: list.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _codeSavingAccount = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    TextFromFiel02(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      userController: observationController,
                      lbText: 'DIGITE ALGUNA OBSERVACIÓNQ',
                    ),
                    SizedBox(
                      width: screenSize.width * 0.4,
                      child: Card(
                        elevation: smallSpacing * 0.5,
                        child: Butoon1(
                          onTap: () {
                            /*int idMoneyOperation = 1;
                            String amountOperation = "56";
                            String codeSavingAccountSource1 =
                                _codeSavingAccountSource ?? '117-2-1-17512-5';
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
                            );*/
                            //if (widget.bloc is SavingAccountDataSuccess) {
                            InjectorContainer.getIt<AppRouter>().push(
                              TransferFeesTwoRoute(
                                cuentaD: _codeSavingAccountSource ?? '',
                                cuentaO: _codeSavingAccount ?? '',
                                monto: transactionAmountController.text,
                                titulares: 'gg',
                                transferencia: 'gg',
                                saldo: 'gg',
                              ),
                            );
                            // }
                          },
                          lblTextField: 'CONTINUAR',
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
