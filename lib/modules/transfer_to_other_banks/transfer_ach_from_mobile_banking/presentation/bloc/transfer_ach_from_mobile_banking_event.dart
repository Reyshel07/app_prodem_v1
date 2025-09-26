part of 'transfer_ach_from_mobile_banking_bloc.dart';

sealed class TransferAchFromMobileBankingEvent {}

final class TransferAchFromMobBanEvent
    extends TransferAchFromMobileBankingEvent {
  final String beneficiary;
  final String identityCardNumber;
  final String accountNumber;
  final String commissionAmount;
  final String observation;
  final String idBankDestiny;
  final String idMoney;
  final String idSavingAccount;
  final String amount;
  final String amountSolicitation;
  final String idWebPersonClient;
  final bool applyGeneratePCC01;
  final String reasonDestinyPCC01;
  final String bankDestinyName;
  final String idSMSOperation;
  final String prodemKeyCode;

  TransferAchFromMobBanEvent({
    required this.beneficiary,
    required this.identityCardNumber,
    required this.accountNumber,
    required this.commissionAmount,
    required this.observation,
    required this.idBankDestiny,
    required this.idMoney,
    required this.idSavingAccount,
    required this.amount,
    required this.amountSolicitation,
    required this.idWebPersonClient,
    required this.applyGeneratePCC01,
    required this.reasonDestinyPCC01,
    required this.bankDestinyName,
    required this.idSMSOperation,
    required this.prodemKeyCode,
  });
}
