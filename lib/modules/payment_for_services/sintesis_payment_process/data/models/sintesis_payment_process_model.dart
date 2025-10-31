import 'dart:convert';
import '../../domain/entities/entity.dart';

SintesisPaymentProcessResponseModel sintesisPaymentProcessResponseFromJson(
  String str,
) => SintesisPaymentProcessResponseModel.fromJson(json.decode(str));

class SintesisPaymentProcessResponseModel
    extends SintesisPaymentProcessResponseEntity {
  SintesisPaymentProcessResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory SintesisPaymentProcessResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => SintesisPaymentProcessResponseModel(
    data: SintesisPaymentProcessModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class SintesisPaymentProcessModel extends SintesisPaymentProcessEntity {
  SintesisPaymentProcessModel({
    required super.voucherData,
    required super.voucherLines,
    required super.eBillData,
    required super.pendingInvoice,
    required super.colEBill,
    required super.idTransaction,
    required super.idExternalMovement,
    required super.reportString,
    required super.reportToPrint,
    required super.reportToPrintForm,
    required super.reportName,
    required super.fileName,
  });

  factory SintesisPaymentProcessModel.fromJson(Map<String, dynamic> json) =>
      SintesisPaymentProcessModel(
        voucherData: json["voucherData"],
        voucherLines: json["voucherLines"],
        eBillData: json["eBillData"],
        pendingInvoice: json["pendingInvoice"],
        colEBill: json["colEBill"],
        idTransaction: json["idTransaction"].toDouble(),
        idExternalMovement: json["idExternalMovement"],
        reportString: json["reportString"],
        reportToPrint: json["reportToPrint"],
        reportToPrintForm: json["reportToPrintForm"],
        reportName: json["reportName"],
        fileName: json["fileName"],
      );
}
