part of 'saving_account_data_bloc.dart';

sealed class SavingAccountDataEvent {}

final class SavingAccountDEvent extends SavingAccountDataEvent {
  final String codeSavingAccountSource;
  final String codeSavingAccount;
  final int idMoneyOperation;
  final String amountOperation;
  SavingAccountDEvent({
    required this.codeSavingAccountSource,
    required this.codeSavingAccount,
    required this.amountOperation,
    required this.idMoneyOperation,
  });
}
