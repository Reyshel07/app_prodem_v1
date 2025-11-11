import 'dart:convert';

import '../../domain/entities/entity.dart';

ListGetOtherAccountDepositResponseModel
listGetOtherAccountDepositResponseFromJson(String str) =>
    ListGetOtherAccountDepositResponseModel.fromJson(json.decode(str));

class ListGetOtherAccountDepositResponseModel
    extends ListGetOtherAccountDepositResponseEntity {
  ListGetOtherAccountDepositResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory ListGetOtherAccountDepositResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => ListGetOtherAccountDepositResponseModel(
    data: List<ListGetOtherAccountDepositModel>.from(
      json["data"].map((x) => ListGetOtherAccountDepositModel.fromJson(x)),
    ),
    state: json["state"],
    message: json["message"],
  );
}

class ListGetOtherAccountDepositModel extends ListGetOtherDccountDepositEntity {
  ListGetOtherAccountDepositModel({
    required super.idThirdOnlineDeposit,
    required super.idPerson,
    required super.idWebOperationReference,
    required super.idcState,
    required super.state,
    required super.codMoney,
    required super.monto,
    required super.thirdAccount,
    required super.thirdName,
    required super.accountFunds,
    required super.destinationFunds,
    required super.depositDate,
    required super.sourceFunds,
  });

  factory ListGetOtherAccountDepositModel.fromJson(Map<String, dynamic> json) =>
      ListGetOtherAccountDepositModel(
        idThirdOnlineDeposit: json["idThirdOnlineDeposit"],
        idPerson: json["idPerson"],
        idWebOperationReference: json["idWebOperationReference"],
        idcState: json["idcState"],
        state: json["state"],
        codMoney: json["codMoney"] ?? '',
        monto: json["monto"],
        thirdAccount: json["thirdAccount"] ?? '',
        thirdName: json["thirdName"] ?? '',
        accountFunds: json["accountFunds"] ?? '',
        destinationFunds: json["destinationFunds"] ?? '',
        depositDate: json["depositDate"] ?? '',
        sourceFunds: json["sourceFunds"] ?? '',
      );
}
