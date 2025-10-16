class GetGenericOperationByIdPersonAndTypeResponseEntity {
  final DataGenericOperationByIdPersonAndTypeEntity data;
  final int state;
  final String message;

  GetGenericOperationByIdPersonAndTypeResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class DataGenericOperationByIdPersonAndTypeEntity {
  final List<ColOperationEntity> colOperations;
  final List<ColAccountEntity> colAccounts;
  final int resultCode;
  final String errorMessage;
  final String reportString;

  DataGenericOperationByIdPersonAndTypeEntity({
    required this.colOperations,
    required this.colAccounts,
    required this.resultCode,
    required this.errorMessage,
    required this.reportString,
  });
}

class ColAccountEntity {
  final int idMoney;
  final String codMoney;
  final String idOperationEntity;
  final String operationCode;
  final int idOperationOffice;
  final double availableAmount;
  final int idcManagementWay;
  final dynamic managementWay;
  final int specialBehavior;
  final String holders;
  final bool selected;

  ColAccountEntity({
    required this.idMoney,
    required this.codMoney,
    required this.idOperationEntity,
    required this.operationCode,
    required this.idOperationOffice,
    required this.availableAmount,
    required this.idcManagementWay,
    required this.managementWay,
    required this.specialBehavior,
    required this.holders,
    required this.selected,
  });
}

class ColOperationEntity {
  final String codeOperation;
  final String stateOperation;
  final String balance;
  final int specialBehavior;

  ColOperationEntity({
    required this.codeOperation,
    required this.stateOperation,
    required this.balance,
    required this.specialBehavior,
  });
}
