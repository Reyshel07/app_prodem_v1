import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountDropdown extends StatefulWidget {
  final String? selectedAccount;
  final ValueChanged<AccountSelection> onAccountSelected;
  final double smallSpacing;
  final Size screenSize;

  const AccountDropdown({
    super.key,
    required this.selectedAccount,
    required this.onAccountSelected,
    required this.smallSpacing,
    required this.screenSize,
  });

  @override
  State<AccountDropdown> createState() => _AccountDropdownState();
}

class _AccountDropdownState extends State<AccountDropdown> {
  String? _selectedAccount;

  @override
  void initState() {
    super.initState();
    _selectedAccount = widget.selectedAccount;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    return BlocConsumer<SessionInfoBloc, SessionInfoState>(
      listener: (_, _) {},
      builder: (context, state) {
        if (state is SessionInfoSuccess) {
          final listAccounts =
              state.userInfoResponseEnttity.listCodeSavingsAccount;

          return Card(
            elevation: widget.smallSpacing * 0.5,
            child: Container(
              height: smallSpacing * 3,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.green),
                borderRadius: BorderRadius.circular(13),
              ),

              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.screenSize.width * 0.05,
                  vertical: widget.smallSpacing * 0.5,
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: Text(
                    "Seleccione una cuenta de la lista:",
                    style: AppTextStyles.mainStyleGreen14Bold(context),
                  ),
                  value: _selectedAccount,
                  items: listAccounts.map((account) {
                    return DropdownMenuItem<String>(
                      value: account.operationCode.toString(),
                      child: Text(
                        '${account.operationCode} - ${account.balance}',
                        style: AppTextStyles.mainStyleGreen14Bold(context),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedAccount = newValue;

                      final selectedAccount = listAccounts.firstWhere(
                        (c) => c.operationCode == newValue,
                      );

                      widget.onAccountSelected(
                        AccountSelection(
                          idOperationEntity: selectedAccount.idOperationEntity
                              .toString(),
                          idMoney: selectedAccount.idMoney.toString(),
                          operationCode: selectedAccount.operationCode
                              .toString(),
                          balance: selectedAccount.balance,
                        ),
                      );
                    });
                  },
                  underline: const SizedBox(),
                ),
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

/// Modelo para devolver la cuenta seleccionada
class AccountSelection {
  final String idOperationEntity;
  final String idMoney;
  final String operationCode;
  final String balance;

  AccountSelection({
    required this.idOperationEntity,
    required this.idMoney,
    required this.operationCode,
    required this.balance,
  });
}

///creditos
class CreditDropdown extends StatefulWidget {
  final String? selectedOperationCode;
  final ValueChanged<CreditSelection> onChanged;
  final Size screenSize;
  final double smallSpacing;

  const CreditDropdown({
    super.key,
    required this.selectedOperationCode,
    required this.onChanged,
    required this.screenSize,
    required this.smallSpacing,
  });

  @override
  State<CreditDropdown> createState() => _CreditDropdownState();
}

class _CreditDropdownState extends State<CreditDropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedOperationCode;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;

    return BlocBuilder<SessionInfoBloc, SessionInfoState>(
      builder: (context, state) {
        if (state is! SessionInfoSuccess) {
          return const SizedBox.shrink();
        }

        final listCredits =
            state.userInfoResponseEnttity.listCodeLoanFlowCredit;

        return Card(
          elevation: widget.smallSpacing * 0.5,
          child: Container(
            height: smallSpacing * 3,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.green),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: widget.screenSize.width * 0.05,
                vertical: widget.smallSpacing * 0.5,
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text(
                  "Seleccione un crédito",
                  style: AppTextStyles.mainStyleGreen14Bold(context),
                ),
                value: _selectedValue,
                items: listCredits.map((credit) {
                  return DropdownMenuItem<String>(
                    value: credit.operationCode.toString(),
                    child: Text(
                      credit.operationCode.toString(),
                      style: AppTextStyles.mainStyleGreen14Bold(context),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() => _selectedValue = newValue);

                  final selectedCredit = listCredits.firstWhere(
                    (c) => c.operationCode == newValue,
                  );

                  widget.onChanged(
                    CreditSelection(
                      idOperationEntity: selectedCredit.idOperationEntity
                          .toString(),
                      operationCode: selectedCredit.operationCode.toString(),
                    ),
                  );
                },
                underline: const SizedBox(),
              ),
            ),
          ),
        );
      },
    );
  }
}

///targeta de creditos
class CreditCardDropdown extends StatefulWidget {
  final String? selectedOperationCode;
  final ValueChanged<CreditSelection> onChanged;
  final Size screenSize;
  final double smallSpacing;

  const CreditCardDropdown({
    super.key,
    required this.selectedOperationCode,
    required this.onChanged,
    required this.screenSize,
    required this.smallSpacing,
  });

  @override
  State<CreditCardDropdown> createState() => _CreditCardDropdownState();
}

class _CreditCardDropdownState extends State<CreditCardDropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedOperationCode;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;

    return BlocBuilder<SessionInfoBloc, SessionInfoState>(
      builder: (context, state) {
        if (state is! SessionInfoSuccess) {
          return const SizedBox.shrink();
        }

        final listCredits =
            state.userInfoResponseEnttity.listCodeLoanFlowCredit;

        return Card(
          elevation: widget.smallSpacing * 0.5,
          child: Container(
            height: smallSpacing * 3,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.green),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: widget.screenSize.width * 0.05,
                vertical: widget.smallSpacing * 0.5,
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text(
                  "Seleccione un crédito",
                  style: AppTextStyles.mainStyleGreen14Bold(context),
                ),
                value: _selectedValue,
                items: listCredits.map((credit) {
                  return DropdownMenuItem<String>(
                    value: credit.operationCode.toString(),
                    child: Text(
                      credit.operationCode.toString(),
                      style: AppTextStyles.mainStyleGreen14Bold(context),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() => _selectedValue = newValue);

                  final selectedCredit = listCredits.firstWhere(
                    (c) => c.operationCode == newValue,
                  );

                  widget.onChanged(
                    CreditSelection(
                      idOperationEntity: selectedCredit.idOperationEntity
                          .toString(),
                      operationCode: selectedCredit.operationCode.toString(),
                    ),
                  );
                },
                underline: const SizedBox(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CreditSelection {
  final String idOperationEntity;
  final String operationCode;

  CreditSelection({
    required this.idOperationEntity,
    required this.operationCode,
  });
}
