part of 'payment_insurance_annuity_bloc.dart';

sealed class PaymentInsuranceAnnuityEvent {}

class PaymentInsuAnnuEvent extends PaymentInsuranceAnnuityEvent {
  final String idInsuranceAnnuity;
  final String idSavingAccount;
  final bool isOwnInsurance;
  final String idSMSOperation;
  final String prodemKeyCode;
  PaymentInsuAnnuEvent({
    required this.idInsuranceAnnuity,
    required this.idSMSOperation,
    required this.idSavingAccount,
    required this.isOwnInsurance,
    required this.prodemKeyCode,
  });
}
