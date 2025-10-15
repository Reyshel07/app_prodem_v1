class LoanFlowGetCreditDetailDataForRecoveryByCodeResponseEntity {
  final LoanFlowGetCreditDetailDataForRecoveryByCodeEntity data;
  final int state;
  final String message;

  LoanFlowGetCreditDetailDataForRecoveryByCodeResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class LoanFlowGetCreditDetailDataForRecoveryByCodeEntity {
  // Campos de WebLoanRecoveryDTO
  final int idLoanCredit;
  final String loanCreditCode;
  final int idLoanCurrency;
  final String loanCurrency;
  final int idCreditState;
  final String creditState;
  final int delayDays;
  final double creditBalance;
  final double transitPayments;
  final double insuranceReturn;
  final double totalCreditAmountToPay;
  final double totalAmountToPay;
  final double totalTax;
  final double totalToDebit;
  final double voluntarySaving;
  final bool allAmountRecovery;
  final bool withInsuranceReturn;
  final String customerName;
  final String identityCard;
  final int idcCreditStateFixedType;
  final int currentAnnuityToPay;
  final DateTime? currentAnnuityEnddingDate;
  final double currentCreditAmountToPay;
  final double savingAccountCommisionAndTax;

  // Campos heredados de DTOResultWebClass
  final String message;
  final bool isValid;
  final String idSavingAccount;
  final double savingBalance;
  final bool applyGenerateConfidentialInformationForm;
  final bool isCloseExecuted;
  final String reportString;
  final String codeSavingAccount;
  final String codeMoney;
  final bool conditionNumberWithdrawalApply;
  final String messageConditionNumberWithdrawal;
  final bool conditionMinimumBalanceApply;
  final String messageConditionMinimumBalance;

  LoanFlowGetCreditDetailDataForRecoveryByCodeEntity({
    required this.idLoanCredit,
    required this.loanCreditCode,
    required this.idLoanCurrency,
    required this.loanCurrency,
    required this.idCreditState,
    required this.creditState,
    required this.delayDays,
    required this.creditBalance,
    required this.transitPayments,
    required this.insuranceReturn,
    required this.totalCreditAmountToPay,
    required this.totalAmountToPay,
    required this.totalTax,
    required this.totalToDebit,
    required this.voluntarySaving,
    required this.allAmountRecovery,
    required this.withInsuranceReturn,
    required this.customerName,
    required this.identityCard,
    required this.idcCreditStateFixedType,
    required this.currentAnnuityToPay,
    required this.currentAnnuityEnddingDate,
    required this.currentCreditAmountToPay,
    required this.savingAccountCommisionAndTax,
    required this.message,
    required this.isValid,
    required this.idSavingAccount,
    required this.savingBalance,
    required this.applyGenerateConfidentialInformationForm,
    required this.isCloseExecuted,
    required this.reportString,
    required this.codeSavingAccount,
    required this.codeMoney,
    required this.conditionNumberWithdrawalApply,
    required this.messageConditionNumberWithdrawal,
    required this.conditionMinimumBalanceApply,
    required this.messageConditionMinimumBalance,
  });
}
