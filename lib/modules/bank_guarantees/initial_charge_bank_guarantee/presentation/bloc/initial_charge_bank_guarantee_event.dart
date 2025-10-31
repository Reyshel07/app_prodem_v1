part of 'initial_charge_bank_guarantee_bloc.dart';

sealed class InitialChargeBankGuaranteeEvent {}

class InitialChargeBankGuarEvent extends InitialChargeBankGuaranteeEvent {
  InitialChargeBankGuarEvent();
}

class GetMoneyByAccountEvent extends InitialChargeBankGuaranteeEvent {
  final String codeAccount;
  GetMoneyByAccountEvent({required this.codeAccount});
}
