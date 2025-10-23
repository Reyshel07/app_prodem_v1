part of 'credit_car_data_for_recovery_bloc.dart';

sealed class CreditCarDataForRecoveryState {}

final class CreditCarDataForRecoveryInitial
    extends CreditCarDataForRecoveryState {}

final class CreditCarDataForRecoveryLoading
    extends CreditCarDataForRecoveryState {}

final class CreditCarDataForRecoveryError
    extends CreditCarDataForRecoveryState {
  final String message;
  CreditCarDataForRecoveryError(this.message);
}

final class CreditCarDataForRecoverySuccess
    extends CreditCarDataForRecoveryState {
  final CreditCardDataForRecoveryResponseEntity creditCardDataForRecovery;
  CreditCarDataForRecoverySuccess(this.creditCardDataForRecovery);
}
