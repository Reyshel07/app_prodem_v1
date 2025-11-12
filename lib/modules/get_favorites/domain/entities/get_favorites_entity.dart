class GetFavoritesResponseEntity {
  final List<GetFavoritesEntity> data;
  final int state;
  final String message;

  GetFavoritesResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetFavoritesEntity {
  final int idCuentasUsadas;
  final String beneficiario;
  final String cuentaDestino;
  final String ciBeneficiario;
  final dynamic celularDestino;
  final int idBancoDestino;
  final String textFavorito;

  GetFavoritesEntity({
    required this.idCuentasUsadas,
    required this.beneficiario,
    required this.cuentaDestino,
    required this.ciBeneficiario,
    required this.celularDestino,
    required this.idBancoDestino,
    required this.textFavorito,
  });
}
