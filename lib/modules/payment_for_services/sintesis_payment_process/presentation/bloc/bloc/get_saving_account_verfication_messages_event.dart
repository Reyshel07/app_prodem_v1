part of 'get_saving_account_verfication_messages_bloc.dart';

sealed class GetSavingAccountVerficationMessagesEvent {}

class GetSavingAccountVerficationMesEvent
    extends GetSavingAccountVerficationMessagesEvent {
  final String idSavingAccount;
  final String idMoney;
  final String transactionAmount;
  GetSavingAccountVerficationMesEvent({
    required this.idSavingAccount,
    required this.idMoney,
    required this.transactionAmount,
  });
}
