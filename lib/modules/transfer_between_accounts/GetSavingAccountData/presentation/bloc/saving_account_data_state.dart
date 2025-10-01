part of 'saving_account_data_bloc.dart';

sealed class SavingAccountDataState {}

final class SavingAccountDataInitial extends SavingAccountDataState {}

final class SavingAccountDataLoading extends SavingAccountDataState {}

final class SavingAccountDataError extends SavingAccountDataState {
  final String message;
  SavingAccountDataError(this.message);
}

final class SavingAccountDataSuccess extends SavingAccountDataState {
  DataSavingAccountEntity dataSavingAccountEntity;
  SavingAccountDataSuccess(this.dataSavingAccountEntity);
}

final class GetAccountByPhoneNumSuccess extends SavingAccountDataState {
  GetAccountByPhoneNumberResponseEntity getAccountByPhoneNumberResponseEntity;
  GetAccountByPhoneNumSuccess(this.getAccountByPhoneNumberResponseEntity);
}
