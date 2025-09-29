class GetProdemExpressSolicitationWebResponseEntity {
  final List<PrExpressSolicitationWebEntity> data;
  final int state;
  final String message;

  GetProdemExpressSolicitationWebResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class PrExpressSolicitationWebEntity {
  final int idProdemExpressSolicitation;
  final DateTime solicitationDate;
  final String officeName;
  final String moneySolicitation;
  final String moneyAccount;
  final String codeSavingsAccount;
  final int amountTransaction;
  final int amountCommision;
  final int amountDebit;
  final int amountTotalDebit;
  final String beneficiaryDi;
  final String beneficiaryName;
  final String cellPhoneBeneficiary;

  PrExpressSolicitationWebEntity({
    required this.idProdemExpressSolicitation,
    required this.solicitationDate,
    required this.officeName,
    required this.moneySolicitation,
    required this.moneyAccount,
    required this.codeSavingsAccount,
    required this.amountTransaction,
    required this.amountCommision,
    required this.amountDebit,
    required this.amountTotalDebit,
    required this.beneficiaryDi,
    required this.beneficiaryName,
    required this.cellPhoneBeneficiary,
  });
}
