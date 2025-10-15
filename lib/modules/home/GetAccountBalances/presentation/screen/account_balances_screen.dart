import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/drop.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';

@RoutePage()
class AccountInquiryScreen extends StatefulWidget {
  final AccountBalanceBloc bloc;
  final SessionInfoBloc sessionBloc;
  const AccountInquiryScreen({
    super.key,
    required this.bloc,
    required this.sessionBloc,
  });

  @override
  State<AccountInquiryScreen> createState() => _AccountInquiryScreenState();
}

class _AccountInquiryScreenState extends State<AccountInquiryScreen> {
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
            'Consulta de Saldos',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(topPadding * 0.05),
          child: Column(
            children: [
              Text(
                'CONSULTA DE SALDOS DE CUENTAS DE AHORRO',
                style: AppTextStyles.mainStyleGreen18Bold(context),
              ),
              SizedBox(height: smallSpacing * 0.5),
              /*BlocBuilder<SessionInfoBloc, SessionInfoState>(
                builder: (context, state) {
                  if (state is SessionInfoSuccess) {
                    final listAccounts =
                        state.userInfoResponseEnttity.listCodeSavingsAccount;
                    // listAccounts[0].operationCode
                    final list = listAccounts
                        .map((account) => account.operationCode)
                        .toList();
                    return Card(
                      elevation: smallSpacing * 0.5,
                      child: SizedBox(
                        width: double.infinity,
                        child: DropdownButton<String>(
                          padding: EdgeInsetsGeometry.all(topPadding * 0.05),
                          hint: const Text("Seleccione una opción"),
                          value: _selectedValue,
                          items: list.map((String value) {
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
                    );
                  }
                  return SizedBox();
                },
              ),*/
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

              SizedBox(
                width: screenSize.width * 0.3,
                child: Card(
                  elevation: smallSpacing * 0.5,
                  child: Butoon1(
                    onTap: () {
                      // String codeSavingsAccount1 = '117-2-1-17515-8';
                      widget.bloc.add(
                        AccountBalEvent(
                          codeSavingsAccount:
                              _selectedAccount ?? '117-2-1-17515-8',
                        ),
                      );
                    },
                    lblTextField: 'CONSULTAR',
                  ),
                ),
              ),
              BlocBuilder<AccountBalanceBloc, AccountBalanceState>(
                builder: (context, state) {
                  if (state is AccountBalanceSuccess) {
                    final res = state.accountDataEntity;
                    return Card(
                      elevation: smallSpacing * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'DATOS DE LA CONSULTA DE SALDO',
                              style: AppTextStyles.mainStyleGreen18Bold(
                                context,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Fecha:\n"
                                      "Cuenta:\n"
                                      "Officina:\n"
                                      "Nombre:\n"
                                      "CI:",
                                      style: AppTextStyles.mainStyleGreen12Bold(
                                        context,
                                      ),
                                    ),
                                    Text(
                                      "Producto:\n",
                                      style: AppTextStyles.mainStyleGreen12Bold(
                                        context,
                                      ),
                                    ),
                                    Text(
                                      "Moneda:\n"
                                      "Saldo\n"
                                      "Disponible:\n"
                                      "Bloqueado:",
                                      style: AppTextStyles.mainStyleGreen12Bold(
                                        context,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: smallSpacing * 15.5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${res!.processDate}\n"
                                        "${res.codeSavingsAccount}\n"
                                        "${res.nameOffice}\n"
                                        "${res.holderName}\n"
                                        "${res.identityCardNumber}",
                                        style: AppTextStyles.mainStyleGreen12(
                                          context,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        res.productName,
                                        style: AppTextStyles.mainStyleGreen12(
                                          context,
                                        ),
                                      ),
                                      Text(
                                        "${res.moneyCode}\n"
                                        "${res.accountBalance}\n"
                                        "${res.accountAvailableBalance}\n"
                                        "${res.blockAmount}",
                                        style: AppTextStyles.mainStyleGreen12(
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
                      ),
                    );
                  }

                  if (state is AccountBalanceLoading) {
                    return CircularProgressIndicator();
                  }

                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
