part of 'atm_transaction_qr_create_bloc.dart';

sealed class AtmTransactionQrCreateEvent {}

class AtmTansactionQrCreEvent extends AtmTransactionQrCreateEvent {
  final String aTMTransactionCode;
  final String amountWithdrawn;
  final String deviceIdentifier;
  final String idATMEntity;
  final String idSavingAccount;
  final String qRGenerated;
  final String? idSMSOperation;
  final String? prodemKeyCode;
  AtmTansactionQrCreEvent({
    required this.aTMTransactionCode,
    required this.amountWithdrawn,
    required this.deviceIdentifier,
    required this.idATMEntity,
    required this.idSMSOperation,
    required this.idSavingAccount,
    required this.prodemKeyCode,
    required this.qRGenerated,
  });
}
