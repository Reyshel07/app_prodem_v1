import 'dart:convert';

import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/domain/entities/saving_account_transfer_mobile_entity.dart';

LoanFlowPaymentCreditResponseModel
loanFlowGetCreditDetailDataForRecoveryFromJson(String str) =>
    LoanFlowPaymentCreditResponseModel.fromJson(json.decode(str));

class LoanFlowPaymentCreditResponseModel
    extends SavingsAccountTransferMobileResponseEntity {
  LoanFlowPaymentCreditResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });
  factory LoanFlowPaymentCreditResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => LoanFlowPaymentCreditResponseModel(
    data: json["data"],
    state: json["state"],
    message: json["message"] ?? "",
  );
}
