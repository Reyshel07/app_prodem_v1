class GetCurrentQrByTypeResponseEntity {
  final GetCurrentQrByTypeEntity data;
  final int state;
  final String message;

  GetCurrentQrByTypeResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetCurrentQrByTypeEntity {
  final String qr;
  final String mensajeQr;
  final int idQr;

  GetCurrentQrByTypeEntity({
    required this.qr,
    required this.mensajeQr,
    required this.idQr,
  });
}
