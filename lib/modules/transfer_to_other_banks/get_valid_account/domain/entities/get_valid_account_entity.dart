class GetValidAccountResponseEntity {
  final GetValidAccountEntity data;
  final int state;
  final String message;

  GetValidAccountResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetValidAccountEntity {
  final String mensaje;
  final int resultado;

  GetValidAccountEntity({required this.mensaje, required this.resultado});
}
