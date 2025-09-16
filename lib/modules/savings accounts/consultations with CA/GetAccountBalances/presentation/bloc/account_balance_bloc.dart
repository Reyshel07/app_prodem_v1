import 'package:app_prodem_v1/modules/savings%20accounts/consultations%20with%20CA/GetAccountBalances/domain/repositories/acount_balances_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'account_balance_event.dart';
part 'account_balance_state.dart';

class AccountBalanceBloc
    extends Bloc<AccountBalanceEvent, AccountBalanceState> {
  AccountBalancesRespositoriy accountBalancesRespositoriy;
  AccountBalanceBloc(this.accountBalancesRespositoriy)
    : super(AccountBalanceInitial()) {
    on<AccountBalEvent>(accountBalance);
  }

  Future<void> accountBalance(
    AccountBalEvent event,
    Emitter<AccountBalanceState> emit,
  ) async {
    emit(AccountBalanceLoading());
    try {
      await accountBalancesRespositoriy.accountBalances(
        event.codeSavingsAccount,
      );
      emit(AccountBalanceSuccess('exitoso'));
    } catch (e) {
      emit(AccountBalanceError('error'));
    }
  }
}
