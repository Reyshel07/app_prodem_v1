class GetEncryptedQrStringResponseEntity {
  final GetEncryptedQrStringEntity data;
  final int state;
  final String message;

  GetEncryptedQrStringResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetEncryptedQrStringEntity {
  final int idQuickResponse;
  final String qrValue;
  final String qrImage;
  final String qrpdfFile;
  final int resultCode;
  final String errorMessage;
  final String reportString;

  GetEncryptedQrStringEntity({
    required this.idQuickResponse,
    required this.qrValue,
    required this.qrImage,
    required this.qrpdfFile,
    required this.resultCode,
    required this.errorMessage,
    required this.reportString,
  });
}
