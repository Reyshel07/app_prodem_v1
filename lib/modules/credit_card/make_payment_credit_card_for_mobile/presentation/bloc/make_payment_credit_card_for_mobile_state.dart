part of 'make_payment_credit_card_for_mobile_bloc.dart';

sealed class MakePaymentCreditCardForMobileState {}

final class MakePaymentCreditCardForMobileInitial
    extends MakePaymentCreditCardForMobileState {}

final class MakePaymentCreditCardForMobileLoading
    extends MakePaymentCreditCardForMobileState {}

final class MakePaymentCreditCardForMobileError
    extends MakePaymentCreditCardForMobileState {
  final String message;
  MakePaymentCreditCardForMobileError(this.message);
}

final class MakePaymentCreditCardForMobileSuccess
    extends MakePaymentCreditCardForMobileState {
  MakePaymentCreditCardForMobileResponseEntity
  makePaymentCreditCardForMobileResponseEntity;
  MakePaymentCreditCardForMobileSuccess(
    this.makePaymentCreditCardForMobileResponseEntity,
  );
}
