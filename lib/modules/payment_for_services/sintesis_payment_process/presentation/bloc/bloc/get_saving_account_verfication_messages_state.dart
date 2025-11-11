part of 'get_saving_account_verfication_messages_bloc.dart';

sealed class GetSavingAccountVerficationMessagesState {}

final class GetSavingAccountVerficationMessagesInitial
    extends GetSavingAccountVerficationMessagesState {}

final class GetSavingAccountVerficationMessagesLoading
    extends GetSavingAccountVerficationMessagesState {}

final class GetSavingAccountVerficationMessagesError
    extends GetSavingAccountVerficationMessagesState {
  final String message;
  GetSavingAccountVerficationMessagesError(this.message);
}

final class GetSavingAccountVerficationMessagesSuccess
    extends GetSavingAccountVerficationMessagesState {
  GetSavingAccountVerficationMessagesResponseEntity
  getSavingAccountVerficationMessagesResponseEntity;
  GetSavingAccountVerficationMessagesSuccess(
    this.getSavingAccountVerficationMessagesResponseEntity,
  );
}
