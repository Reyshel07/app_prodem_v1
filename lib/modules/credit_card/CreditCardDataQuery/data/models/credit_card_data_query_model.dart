import 'dart:convert';
import '../../domain/entities/entity.dart';

CreditCardDataQueryResponseModel creditCardDataQueryResponseFromJson(
  String str,
) => CreditCardDataQueryResponseModel.fromJson(json.decode(str));

///ejemplo de respuestas complicadas
class CreditCardDataQueryResponseModel
    extends CreditCardDataQueryResponseEntity {
  CreditCardDataQueryResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory CreditCardDataQueryResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => CreditCardDataQueryResponseModel(
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
        idCreditLineSolicitation: json["idCreditLineSolicitation"].toDouble(),
        accountNumber: json["accountNumber"],
        clientName: json["clientName"],
        creditLineAmount: json["creditLineAmount"],
        balanceAmount: json["balanceAmount"].toDouble(),
        balanceAvailable: json["balanceAvailable"].toDouble(),
        minimumPayment: json["minimumPayment"].toDouble(),
        loanCurrencyName: json["loanCurrencyName"],
        processDate: DateTime.parse(json["processDate"]),
        principalBalance: json["principalBalance"].toDouble(),
        principalBalanceAtc: json["principalBalanceATC"],
        colMovementsDetails: List<ColMovementsDetailModel>.from(
          json["colMovementsDetails"].map(
            (x) => ColMovementsDetailModel.fromJson(x),
          ),
        ),
      );
}

class ColMovementsDetailModel extends ColMovementsDetailEntity {
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
        transactionAmount: json["transactionAmount"].toDouble(),
        operationDescription: json["operationDescription"],
        operationKind: json["operationKind"],
      );
}
