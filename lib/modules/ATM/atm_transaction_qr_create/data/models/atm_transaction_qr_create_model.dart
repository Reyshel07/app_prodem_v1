import 'dart:convert';

import 'package:app_prodem_v1/modules/ATM/atm_transaction_qr_create/domain/entities/atm_transaction_qr_create_entity.dart';

AtmTransactionQrCreateResponseModel atmTransactionQrCreateResponseFromJson(
  String str,
) => AtmTransactionQrCreateResponseModel.fromJson(json.decode(str));

class AtmTransactionQrCreateResponseModel
    extends AtmTransactionQrCreateResponseEntity {
  AtmTransactionQrCreateResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory AtmTransactionQrCreateResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => AtmTransactionQrCreateResponseModel(
    data: json["data"],
    state: json["state"],
    message: json["message"],
  );
}
