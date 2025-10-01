part of 'get_account_enable_to_transfer_bloc.dart';

sealed class GetAccountEnableToTransferState {}

final class GetAccountEnableToTransferInitial
    extends GetAccountEnableToTransferState {}

final class GetAccountEnableToTransferLoading
    extends GetAccountEnableToTransferState {}

final class GetAccountEnableToTransferError
    extends GetAccountEnableToTransferState {
  final String message;
  GetAccountEnableToTransferError(this.message);
}

final class GetAccountEnableToTransferSuccess
    extends GetAccountEnableToTransferState {
  final GetAccountEnabledToTransferResponseEntity
  getAccountEnabledToTransferResponseEntity;
  GetAccountEnableToTransferSuccess(
    this.getAccountEnabledToTransferResponseEntity,
  );
}

final class AccountEnableToTransferSaveSuccess
    extends GetAccountEnableToTransferState {
  AccountEnabledToTransferSaveResponseEntity
  accountEnabledToTransferSaveResponseEntity;
  AccountEnableToTransferSaveSuccess(
    this.accountEnabledToTransferSaveResponseEntity,
  );
}
