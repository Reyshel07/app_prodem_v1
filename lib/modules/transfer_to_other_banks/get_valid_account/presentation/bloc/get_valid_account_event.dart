part of 'get_valid_account_bloc.dart';

sealed class GetValidAccountEvent {}

class GetValidAEvent extends GetValidAccountEvent {
  final String idbank;
  final String accountNumber;
  GetValidAEvent({required this.accountNumber, required this.idbank});
}
