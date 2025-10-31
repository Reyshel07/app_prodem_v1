class SintesisPaymentProcessResponseEntity {
  final SintesisPaymentProcessEntity data;
  final int state;
  final String message;

  SintesisPaymentProcessResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class SintesisPaymentProcessEntity {
  final dynamic voucherData;
  final dynamic voucherLines;
  final String eBillData;
  final bool pendingInvoice;
  final dynamic colEBill;
  final double idTransaction;
  final int idExternalMovement;
  final String reportString;
  final String reportToPrint;
  final String reportToPrintForm;
  final String reportName;
  final String fileName;

  SintesisPaymentProcessEntity({
    required this.voucherData,
    required this.voucherLines,
    required this.eBillData,
    required this.pendingInvoice,
    required this.colEBill,
    required this.idTransaction,
    required this.idExternalMovement,
    required this.reportString,
    required this.reportToPrint,
    required this.reportToPrintForm,
    required this.reportName,
    required this.fileName,
  });
}
