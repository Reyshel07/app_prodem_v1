class InforAccionesResponseEntity {
  final List<InforAccionesEntity> data;
  final int state;
  final String message;

  InforAccionesResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class InforAccionesEntity {
  final String info;
  final int idTipoOperacion;
  final String tipo;
  final String grupo;
  final dynamic dpfExpiracion;

  InforAccionesEntity({
    required this.info,
    required this.idTipoOperacion,
    required this.tipo,
    required this.grupo,
    required this.dpfExpiracion,
  });
}
