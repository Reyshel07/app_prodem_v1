class VerificaPlazoRenovacionResponseEntity {
  final VerificaPlazoRenovacionEntity data;
  final int state;
  final String message;

  VerificaPlazoRenovacionResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class VerificaPlazoRenovacionEntity {
  final int idDpfOffice;
  final int termInDays;

  VerificaPlazoRenovacionEntity({
    required this.idDpfOffice,
    required this.termInDays,
  });
}

///VerifyRedeemResponse

class VerifyRedeemResponseEntity {
  final VerifyRedeemEntity data;
  final int state;
  final String message;

  VerifyRedeemResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class VerifyRedeemEntity {
  final int tipo;
  final String info;

  VerifyRedeemEntity({required this.tipo, required this.info});
}

//// ValidateAndSaveRenovationDpfResponse
class ValidateAndSaveRenovationDpfResponseEntity {
  final String data;
  final int state;
  final String message;

  ValidateAndSaveRenovationDpfResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}
