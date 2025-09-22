part of 'account_balance_bloc.dart';

//enum AccountBalancesStatus { initial, loading, success, error }
sealed class AccountBalanceState {}

final class AccountBalanceInitial extends AccountBalanceState {}

final class AccountBalanceLoading extends AccountBalanceState {}

final class AccountBalanceError extends AccountBalanceState {
  final String message;
  AccountBalanceError(this.message);
}

final class AccountBalanceSuccess extends AccountBalanceState {
  AccountDataEntity? accountDataEntity;
  AccountBalanceSuccess(this.accountDataEntity);
}
