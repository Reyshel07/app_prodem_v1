part of 'get_account_numberln_other_bank_bloc.dart';

sealed class GetAccountNumberlnOtherBankState {}

final class GetAccountNumberlnOtherBankInitial
    extends GetAccountNumberlnOtherBankState {}

final class GetAccountNumberlnOtherBankLoading
    extends GetAccountNumberlnOtherBankState {}

final class GetAccountNumberlnOtherBankError
    extends GetAccountNumberlnOtherBankState {
  final String message;
  GetAccountNumberlnOtherBankError(this.message);
}

final class GetAccountNumberlnOtherBankSuccess
    extends GetAccountNumberlnOtherBankState {
  GetAccountNumberInOtherBankResponseEntity
  getAccountNumberInOtherBankResponseEntity;
  GetAccountNumberlnOtherBankSuccess(
    this.getAccountNumberInOtherBankResponseEntity,
  );
}
