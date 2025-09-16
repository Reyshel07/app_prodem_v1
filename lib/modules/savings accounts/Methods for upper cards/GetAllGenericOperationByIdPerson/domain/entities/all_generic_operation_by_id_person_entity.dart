class GetAllGenericOperationByIdPersonResponseEntity {
  final DataAllGenericOperationByIdPersonEntity data;
  final int state;
  final String message;

  GetAllGenericOperationByIdPersonResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class DataAllGenericOperationByIdPersonEntity {
  final List<ColEntity> colAccounts;
  final List<dynamic> colDpfs;
  final List<ColEntity> colCredits;
  final List<ColEntity> colCreditCards;
  final int resultCode;
  final String errorMessage;
  final String reportString;

  DataAllGenericOperationByIdPersonEntity({
    required this.colAccounts,
    required this.colDpfs,
    required this.colCredits,
    required this.colCreditCards,
    required this.resultCode,
    required this.errorMessage,
    required this.reportString,
  });
}

class ColEntity {
  final String codeOperation;
  final String stateOperation;
  final String balance;
  final int specialBehavior;

  ColEntity({
    required this.codeOperation,
    required this.stateOperation,
    required this.balance,
    required this.specialBehavior,
  });
}
