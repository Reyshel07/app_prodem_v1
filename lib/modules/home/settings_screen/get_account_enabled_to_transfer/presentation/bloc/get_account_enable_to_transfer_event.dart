part of 'get_account_enable_to_transfer_bloc.dart';

sealed class GetAccountEnableToTransferEvent {}

class GEtAccountEnableToTransEvent extends GetAccountEnableToTransferEvent {
  GEtAccountEnableToTransEvent();
}

class AccountEnableToTransSaveEvent extends GetAccountEnableToTransferEvent {
  final String idSavingAccount;
  final String codeAccount;
  final bool isActive;
  AccountEnableToTransSaveEvent({
    required this.codeAccount,
    required this.idSavingAccount,
    required this.isActive,
  });
}
