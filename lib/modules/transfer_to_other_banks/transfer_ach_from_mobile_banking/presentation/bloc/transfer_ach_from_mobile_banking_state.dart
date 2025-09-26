part of 'transfer_ach_from_mobile_banking_bloc.dart';

sealed class TransferAchFromMobileBankingState {}

final class TransferAchFromMobileBankingInitial
    extends TransferAchFromMobileBankingState {}

final class TransferAchFromMobileBankingLoading
    extends TransferAchFromMobileBankingState {}

final class TransferAchFromMobileBankingError
    extends TransferAchFromMobileBankingState {
  final String message;
  TransferAchFromMobileBankingError(this.message);
}

final class TransferAchFromMobileBankingSuccess
    extends TransferAchFromMobileBankingState {
  SavingsAccountTransferMobileResponseEntity data;
  TransferAchFromMobileBankingSuccess(this.data);
}
