part of 'get_valid_account_bloc.dart';

sealed class GetValidAccountEvent {}

class GetValidAccoEvent extends GetValidAccountEvent {
  final String idbank;
  final String accountNumber;
  GetValidAccoEvent(this.idbank, this.accountNumber);
}
