part of 'initial_charge_bank_guarantee_bloc.dart';

sealed class InitialChargeBankGuaranteeState {}

final class InitialChargeBankGuaranteeInitial
    extends InitialChargeBankGuaranteeState {}

final class InitialChargeBankGuaranteeLoading
    extends InitialChargeBankGuaranteeState {}

final class InitialChargeBankGuaranteeError
    extends InitialChargeBankGuaranteeState {
  final String message;
  InitialChargeBankGuaranteeError(this.message);
}

final class InitialChargeBankGuaranteeSuccess
    extends InitialChargeBankGuaranteeState {
  final InitialChargeBankGuaranteeResponseEntity data;
  InitialChargeBankGuaranteeSuccess(this.data);
}
