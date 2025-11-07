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
