part of 'account_balance_bloc.dart';

//enum AccountBalancesStatus { initial, loading, success, error }
sealed class AccountBalanceState {
  /* final AccountDataEntity? accountBalances;
  final AccountBalancesStatus status;

  const AccountBalanceState({
    this.accountBalances,
    this.status = AccountBalancesStatus.initial,
  });

  factory AccountBalanceState.initialState() => const AccountBalanceState();

  AccountBalanceState copyWith({
    AccountDataEntity? accountBalances,
    AccountBalancesStatus? status,
  }) {
    return AccountBalanceState(
      accountBalances: accountBalances ?? this.accountBalances,
      status: status ?? this.status,
    );
  }*/
}

final class AccountBalanceInitial extends AccountBalanceState {}

final class AccountBalanceLoading extends AccountBalanceState {}

final class AccountBalanceError extends AccountBalanceState {
  final String message;
  AccountBalanceError(this.message);
}

final class AccountBalanceSuccess extends AccountBalanceState {
  GetAccountBalancesResponseEntity getAccountBalancesResponseEntity;
  AccountBalanceSuccess(this.getAccountBalancesResponseEntity);
}

/*extension AccountBalancesStateX on AccountBalanceState {
  bool get isLoading => status == AccountBalancesStatus.loading;
  bool get isSuccess => status == AccountBalancesStatus.success;
  bool get isError => status == AccountBalancesStatus.error;
  bool get hasData => accountBalances != null;
}*/
