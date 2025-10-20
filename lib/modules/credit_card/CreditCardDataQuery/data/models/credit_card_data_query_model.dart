import 'dart:convert';
import 'package:app_prodem_v1/modules/credit_card/CreditCardDataQuery/domain/entities/credit_card_data_query_entity.dart';

CreditCardDataQueryResponseModel creditCardDataQueryFromJson(String str) =>
    CreditCardDataQueryResponseModel.fromJson(json.decode(str));

class CreditCardDataQueryResponseModel extends CreditCardDataQueryResponseEntity {
  CreditCardDataQueryResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory CreditCardDataQueryResponseModel.fromJson(Map<String, dynamic> json) =>
      CreditCardDataQueryResponseModel(
        data: CreditCardDataQueryModel.fromJson(json["data"]),
        state: json["state"],
        message: json["message"],
      );
}

class CreditCardDataQueryModel extends CreditCardDataQueryEntity {
  CreditCardDataQueryModel({
    required super.idCreditLineSolicitation,
    required super.accountNumber,
    required super.clientName,
    required super.creditLineAmount,
    required super.balanceAmount,
    required super.balanceAvailable,
    required super.minimumPayment,
    required super.loanCurrencyName,
    required super.processDate,
    required super.principalBalance,
    required super.principalBalanceAtc,
    required super.colMovementsDetails,
  });

  factory CreditCardDataQueryModel.fromJson(Map<String, dynamic> json) =>
      CreditCardDataQueryModel(
        idCreditLineSolicitation: json["idCreditLineSolicitation"], // int
        accountNumber: json["accountNumber"],
        clientName: json["clientName"],
        creditLineAmount: (json["creditLineAmount"] ?? 0).toDouble(),
        balanceAmount: (json["balanceAmount"] ?? 0).toDouble(),
        balanceAvailable: (json["balanceAvailable"] ?? 0).toDouble(),
        minimumPayment: (json["minimumPayment"] ?? 0).toDouble(),
        loanCurrencyName: json["loanCurrencyName"],
        processDate: DateTime.parse(json["processDate"]),
        principalBalance: (json["principalBalance"] ?? 0).toDouble(),
        principalBalanceAtc: (json["principalBalanceATC"] ?? 0).toDouble(),
        colMovementsDetails: (json["colMovementsDetails"] as List)
            .map((x) => ColMovementsDetailModel.fromJson(x))
            .toList(),
      );
}

class ColMovementsDetailModel extends ColMovementsDetail {
  ColMovementsDetailModel({
    required super.loanCurrencyName,
    required super.transactionDate,
    required super.transactionAmount,
    required super.operationDescription,
    required super.operationKind,
  });

  factory ColMovementsDetailModel.fromJson(Map<String, dynamic> json) =>
      ColMovementsDetailModel(
        loanCurrencyName: json["loanCurrencyName"],
        transactionDate: DateTime.parse(json["transactionDate"]),
        transactionAmount: (json["transactionAmount"] ?? 0).toDouble(),
        operationDescription: json["operationDescription"],
        operationKind: json["operationKind"],
      );
}
