part of 'account_balance_bloc.dart';

enum AccountBalancesStatus { initial, loading, success, error }

class AccountBalanceState {
  final AccountDataEntity? accountBalances;
  final AccountBalancesStatus status;

  const AccountBalanceState({
    this.accountBalances,
    this.status = AccountBalancesStatus.initial,
  });

  factory AccountBalanceState.initialState() => const AccountBalanceState();

  AccountBalanceState copyWith({
    AccountDataEntity? accountBal,
    AccountBalancesStatus? status,
  }) {
    return AccountBalanceState(
      accountBalances: accountBal ?? this.accountBalances,
      status: status ?? this.status,
    );
  }
}

extension AccountBalancesStateX on AccountBalanceState {
  bool get isLoading => status == AccountBalancesStatus.loading;
  bool get isSuccess => status == AccountBalancesStatus.success;
  bool get isError => status == AccountBalancesStatus.error;
  bool get hasData => accountBalances != null;
}
