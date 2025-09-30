class SavingsAccountExtractDataTransactionableResponseEntity {
  final DataSavingAccountExtracEntity data;
  final int state;
  final String message;

  SavingsAccountExtractDataTransactionableResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class DataSavingAccountExtracEntity {
  final String codeSavingsAccount;
  final String moneyCode;
  final DateTime processDate;
  final double accountBalance;
  final double accountAvailableBalance;
  final String messageInvoicingProof;
  final List<ColDetailsMovemmentEntity> colDetailsMovemment;
  final List<ColMovemmentPendingstEntity>? colMovemmentPendings;
  DataSavingAccountExtracEntity({
    required this.codeSavingsAccount,
    required this.moneyCode,
    required this.processDate,
    required this.accountBalance,
    required this.accountAvailableBalance,
    required this.messageInvoicingProof,
    required this.colDetailsMovemment,
    required this.colMovemmentPendings,
  });
}

class ColDetailsMovemmentEntity {
  final String reference;
  final DateTime dateTransaction;
  final String descriptionOperation;
  final String officeTransaction;
  final double deposit;
  final double withdrawal;
  final double amountBalance;

  ColDetailsMovemmentEntity({
    required this.reference,
    required this.dateTransaction,
    required this.descriptionOperation,
    required this.officeTransaction,
    required this.deposit,
    required this.withdrawal,
    required this.amountBalance,
  });
}

class ColMovemmentPendingstEntity {
  final DateTime dateTransaction;
  final String descriptionOperation;
  final double amountBalance;
  final String officeName;
  final String reference;
  ColMovemmentPendingstEntity({
    required this.amountBalance,
    required this.dateTransaction,
    required this.descriptionOperation,
    required this.officeName,
    required this.reference,
  });
}
