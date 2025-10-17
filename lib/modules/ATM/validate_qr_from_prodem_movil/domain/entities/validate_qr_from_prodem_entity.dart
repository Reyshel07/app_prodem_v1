class ValidateQrFromProdemMovilResponseEntity {
  final ValidateQrFromProdemMovilEntity data;
  final int state;
  final String message;

  ValidateQrFromProdemMovilResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class ValidateQrFromProdemMovilEntity {
  final int idAtm;
  final String atmName;
  final int idTransactionAtm;
  final String qRuuid;
  final List<int> colCuts;

  ValidateQrFromProdemMovilEntity({
    required this.idAtm,
    required this.atmName,
    required this.idTransactionAtm,
    required this.qRuuid,
    required this.colCuts,
  });
}
