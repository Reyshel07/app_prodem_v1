part of 'make_payment_credit_card_for_mobile_bloc.dart';

sealed class MakePaymentCreditCardForMobileEvent {}

class MakePaymentCreditCardForMoEvent
    extends MakePaymentCreditCardForMobileEvent {
  final String idCreditLineInstance;
  final String idSavingAccount;
  final String amountPayment;
  final String idLoanCurrency;
  final String idSavingAccountMoney;
  final String codeAuthentication;
  final String idPersonLogged;
  final String creditCardAccountNumber;
  final String customerName;
  final bool isOwnCreditCard;
  final String? idSMSOperation;
  final String? prodemKeyCode;
  MakePaymentCreditCardForMoEvent({
    required this.amountPayment,
    required this.codeAuthentication,
    required this.creditCardAccountNumber,
    required this.customerName,
    required this.idCreditLineInstance,
    required this.idLoanCurrency,
    required this.idPersonLogged,
    required this.idSMSOperation,
    required this.idSavingAccount,
    required this.idSavingAccountMoney,
    required this.isOwnCreditCard,
    required this.prodemKeyCode,
  });
}
