part of 'credit_car_data_for_recovery_bloc.dart';

sealed class CreditCarDataForRecoveryEvent {}

class CreditCarDataForRecorEvent extends CreditCarDataForRecoveryEvent {
  final String idCreditLineInstance;
  final String creditCardNumber;
  final String codeSavingAccountSource;
  final String amountOperation;
  final int idMoneyOperation;
  CreditCarDataForRecorEvent({
    required this.amountOperation,
    required this.codeSavingAccountSource,
    required this.creditCardNumber,
    required this.idCreditLineInstance,
    required this.idMoneyOperation,
  });
}
