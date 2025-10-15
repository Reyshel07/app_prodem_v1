import 'dart:convert';

import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/domain/entities/saving_account_transfer_mobile_entity.dart';

LoanFlowPaymentCreditThirdResponseModel
loanFlowGetCreditDetailDataForRecoveryFromJson(String str) =>
    LoanFlowPaymentCreditThirdResponseModel.fromJson(json.decode(str));

class LoanFlowPaymentCreditThirdResponseModel
    extends SavingsAccountTransferMobileResponseEntity {
  LoanFlowPaymentCreditThirdResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });
  factory LoanFlowPaymentCreditThirdResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => LoanFlowPaymentCreditThirdResponseModel(
    data: json["data"],
    state: json["state"],
    message: json["message"] ?? "",
  );
}
