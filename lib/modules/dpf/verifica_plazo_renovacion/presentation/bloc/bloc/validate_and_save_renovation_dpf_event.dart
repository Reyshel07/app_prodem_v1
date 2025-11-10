part of 'validate_and_save_renovation_dpf_bloc.dart';

sealed class ValidateAndSaveRenovationDpfEvent {}

class ValidateAndSaveRenoDpfEvent extends ValidateAndSaveRenovationDpfEvent {
  final String idRenovationDPF;
  final String idcDPFMFInitial;
  final String idcDPFMFNew;
  final String idcOperationType;
  final String cellPhone;
  final String email;
  final String idDpfOffice;
  final String amount;
  final String termInDays;
  final String rate;
  final String interestEarned;
  final String finalAmount;
  final String originResources;
  final String idcState;
  final String contextData;
  final String solicitationDate;
  final String idMoney;
  final String fullName;
  final String idSavingsAccount;
  final String codeSMS;
  final bool withProdemKey;
  final bool isDpfEmployee;
  final String codeSavingAccount;
  final String idcOperationTypeAUX;
  final String idcInfoType;
  final bool isAnotherAccount;
  final String amountOnAccount;
  final String oldAmount;
  final String interestAmountOld;
  final String capitalRenew;
  final String renewalTax;
  final String closingTax;
  final String idDepositProduct;
  final String depositProduct;
  final String hashTracking;
  final bool isPignorado;
  final String? idSMSOperation;
  final String? prodemKeyCode;
  ValidateAndSaveRenoDpfEvent({
    required this.amount,
    required this.amountOnAccount,
    required this.cellPhone,
    required this.closingTax,
    required this.codeSMS,
    required this.codeSavingAccount,
    required this.contextData,
    required this.depositProduct,
    required this.email,
    required this.fullName,
    required this.idDpfOffice,
    required this.idDepositProduct,
    required this.idMoney,
    required this.idRenovationDPF,
    required this.idSavingsAccount,
    required this.idcDPFMFInitial,
    required this.idcDPFMFNew,
    required this.idcInfoType,
    required this.idcOperationType,
    required this.idcOperationTypeAUX,
    required this.idcState,
    required this.interestAmountOld,
    required this.interestEarned,
    required this.isAnotherAccount,
    required this.isDpfEmployee,
    required this.isPignorado,
    required this.oldAmount,
    required this.originResources,
    required this.rate,
    required this.solicitationDate,
    required this.termInDays,
    required this.renewalTax,
    required this.finalAmount,
    required this.capitalRenew,
    required this.hashTracking,
    this.idSMSOperation,
    this.prodemKeyCode,
    required this.withProdemKey,
  });
}
