part of 'save_online_third_deposit_bloc.dart';

sealed class SaveOnlineThirdDepositState {}

final class SaveOnlineThirdDepositInitial extends SaveOnlineThirdDepositState {}

final class SaveOnlineThirdDepositLoading extends SaveOnlineThirdDepositState {}

final class SaveOnlineThirdDepositError extends SaveOnlineThirdDepositState {
  final String message;
  SaveOnlineThirdDepositError(this.message);
}

final class SaveOnlineThirdDepositSuccess extends SaveOnlineThirdDepositState {
  SaveOnlineThirdDepositResponseEntity saveOnlineThirdDepositResponseEntity;
  SaveOnlineThirdDepositSuccess(this.saveOnlineThirdDepositResponseEntity);
}
