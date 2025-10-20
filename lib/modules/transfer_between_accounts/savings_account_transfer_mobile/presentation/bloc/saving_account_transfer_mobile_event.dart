part of 'saving_account_transfer_mobile_bloc.dart';

sealed class SavingAccountTransferMobileEvent {}

final class SavingAccountTransMoEvent extends SavingAccountTransferMobileEvent {
  final String codeSavingAccountSource;
  final String codeSavingAccountTarget;
  final String amountTransfer;
  final String idMoneyTransfer;
  final bool isNaturalCustomer;
  final String observation;
  final String reasonDestiny;
  final String typeApplicationAccessX;
  final String idTerminal;
  final String userAppOriginType;
  final String beneficiaryName;
  final String idSMSOperation;
  final String prodemKeyCode;
  final String reasonOrigin;
  final String obfuscatedCode;
  SavingAccountTransMoEvent({
    required this.codeSavingAccountSource,
    required this.codeSavingAccountTarget,
    required this.amountTransfer,
    required this.idMoneyTransfer,
    required this.isNaturalCustomer,
    required this.observation,
    required this.reasonDestiny,
    required this.typeApplicationAccessX,
    required this.idTerminal,
    required this.userAppOriginType,
    required this.beneficiaryName,
    required this.idSMSOperation,
    required this.prodemKeyCode,
    required this.obfuscatedCode,
    required this.reasonOrigin,
  });
}
