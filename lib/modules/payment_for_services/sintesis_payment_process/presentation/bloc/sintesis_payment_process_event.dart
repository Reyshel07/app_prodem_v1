part of 'sintesis_payment_process_bloc.dart';

sealed class SintesisPaymentProcessEvent {}

class SintesisPaymentProEvent extends SintesisPaymentProcessEvent {
  final String idOffice;
  final String idCustomer;
  final String invoiceNIT;
  final String invoiceName;
  final String invoiceCustomerEmail;
  final String invoiceDocumentType;
  final String invoiceDocumentComplement;
  final String invoicePhone;
  final String idExternalSystem;
  final String searchData;
  final String idMoney;
  final String mFServiceCode;
  final String externalSystemPaymentID;
  final String totalToPay;
  final bool isMobile;
  final String idSavingAccount;
  final String numberTranCAI;
  final String serieCAI;
  final bool createInvoicingPendding;
  final String codeAuthentication;
  final String externalModule;
  final String savingAccountOperation;
  final String useCode;
  final String deviceIMEI;
  final String operationNumber;
  final String operativeDate;
  final String accountCode;
  final String serviceCode;
  final String collectionType;
  final String carDepartment;
  final String carType;
  final String carUseType;
  final String userToken;
  final String codeSintesisModule;
  final String codesavingAccount;
  final String codeMoney;
  final String itemNumberCode;
  final String itemAmount;
  final String batchDosage;
  final String rentNumber;
  final String itemPeriod;
  final String itemDescription;
  final String itemDate;
  final String? idSMSOperation;
  final String? prodemKeyCode;
  final String idUser;
  SintesisPaymentProEvent({
    required this.accountCode,
    required this.batchDosage,
    required this.carDepartment,
    required this.carType,
    required this.carUseType,
    required this.codeAuthentication,
    required this.codeMoney,
    required this.codeSintesisModule,
    required this.codesavingAccount,
    required this.collectionType,
    required this.createInvoicingPendding,
    required this.deviceIMEI,
    required this.externalModule,
    required this.externalSystemPaymentID,
    required this.idCustomer,
    required this.idExternalSystem,
    required this.idMoney,
    required this.idOffice,
    required this.idSavingAccount,
    required this.invoiceCustomerEmail,
    required this.invoiceDocumentComplement,
    required this.invoiceDocumentType,
    required this.invoiceNIT,
    required this.invoiceName,
    required this.invoicePhone,
    required this.isMobile,
    required this.itemAmount,
    required this.itemDate,
    required this.itemDescription,
    required this.itemNumberCode,
    required this.itemPeriod,
    required this.mFServiceCode,
    required this.numberTranCAI,
    required this.operationNumber,
    required this.operativeDate,
    required this.rentNumber,
    required this.savingAccountOperation,
    required this.searchData,
    required this.serieCAI,
    required this.serviceCode,
    required this.totalToPay,
    required this.useCode,
    required this.userToken,
    required this.idSMSOperation,
    required this.prodemKeyCode,
    required this.idUser,
  });
}
