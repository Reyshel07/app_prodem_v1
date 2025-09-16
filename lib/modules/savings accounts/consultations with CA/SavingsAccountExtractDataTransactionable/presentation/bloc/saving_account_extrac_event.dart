part of 'saving_account_extrac_bloc.dart';

sealed class SavingAccountExtracEvent {}

final class SavingAccountExEnevet extends SavingAccountExtracEvent {
  final String codeSavingsAccount;
  SavingAccountExEnevet({required this.codeSavingsAccount});
}
