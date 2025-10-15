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
    Key? key,
    required this.selectedAccount,
    required this.onAccountSelected,
    required this.smallSpacing,
    required this.screenSize,
  }) : super(key: key);

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
    return BlocConsumer<SessionInfoBloc, SessionInfoState>(
      listener: (_, __) {},
      builder: (context, state) {
        if (state is SessionInfoSuccess) {
          final listAccounts =
              state.userInfoResponseEnttity.listCodeSavingsAccount;

          return Card(
            elevation: widget.smallSpacing * 0.5,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: widget.screenSize.width * 0.05,
                vertical: widget.smallSpacing * 0.5,
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                hint: const Text("Seleccione una cuenta de la lista:"),
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
                        operationCode: selectedAccount.operationCode.toString(),
                      ),
                    );
                  });
                },
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

  AccountSelection({
    required this.idOperationEntity,
    required this.idMoney,
    required this.operationCode,
  });
}
