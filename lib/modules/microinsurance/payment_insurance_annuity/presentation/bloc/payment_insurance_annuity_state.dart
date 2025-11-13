part of 'payment_insurance_annuity_bloc.dart';

sealed class PaymentInsuranceAnnuityState {}

final class PaymentInsuranceAnnuityInitial
    extends PaymentInsuranceAnnuityState {}

final class PaymentInsuranceAnnuityLoading
    extends PaymentInsuranceAnnuityState {}

final class PaymentInsuranceAnnuityError extends PaymentInsuranceAnnuityState {
  final String message;
  PaymentInsuranceAnnuityError(this.message);
}

final class PaymentInsuranceAnnuitySuccess
    extends PaymentInsuranceAnnuityState {
  PaymentInsuranceAnnuityResponseEntity paymentInsuranceAnnuityResponseEntity;
  PaymentInsuranceAnnuitySuccess(this.paymentInsuranceAnnuityResponseEntity);
}
