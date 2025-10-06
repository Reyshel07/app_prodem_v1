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
  final double amountTransaction;
  final double amountCommision;
  final double amountDebit;
  final double amountTotalDebit;
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

class ProdemExpressAnnulmentResponseEntity {
  final String data;
  final int state;
  final String message;

  ProdemExpressAnnulmentResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}
