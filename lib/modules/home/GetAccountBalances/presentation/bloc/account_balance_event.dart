part of 'account_balance_bloc.dart';

sealed class AccountBalanceEvent {}

final class AccountBalEvent extends AccountBalanceEvent {
  final String codeSavingsAccount;
  AccountBalEvent({required this.codeSavingsAccount});
}
