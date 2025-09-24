part of 'saving_account_transfer_mobile_bloc.dart';

sealed class SavingAccountTransferMobileState {}

final class SavingAccountTransferMobileInitial
    extends SavingAccountTransferMobileState {}

final class SavingAccountTransferMobileLoading
    extends SavingAccountTransferMobileState {}

final class SavingAccountTransferMobiletaError
    extends SavingAccountTransferMobileState {
  final String message;
  SavingAccountTransferMobiletaError(this.message);
}

final class SavingAccountTransferMobileSuccess
    extends SavingAccountTransferMobileState {
  SavingsAccountTransferMobileResponseEntity data;
  SavingAccountTransferMobileSuccess(this.data);
}
