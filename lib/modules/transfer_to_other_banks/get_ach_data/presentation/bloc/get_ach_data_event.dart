part of 'get_ach_data_bloc.dart';

sealed class GetAchDataEvent {}

class GetAchDaEvent extends GetAchDataEvent {
  final String idSavingsAccount;
  final String amountTransaction;
  final String idMoney;
  final bool isNaturalClient;
  GetAchDaEvent({
    required this.amountTransaction,
    required this.idMoney,
    required this.idSavingsAccount,
    required this.isNaturalClient,
  });
}
