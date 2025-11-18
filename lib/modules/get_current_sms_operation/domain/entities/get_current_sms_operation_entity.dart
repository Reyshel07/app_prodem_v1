class GetCurrentSmsOperationResponseEntity {
  final GetCurrentSmsOperationEntity data;
  final int state;
  final String message;

  GetCurrentSmsOperationResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetCurrentSmsOperationEntity {
  final int idSmsOperacion;
  final String transactionDetail;
  final String locationData;

  GetCurrentSmsOperationEntity({
    required this.idSmsOperacion,
    required this.transactionDetail,
    required this.locationData,
  });
}
