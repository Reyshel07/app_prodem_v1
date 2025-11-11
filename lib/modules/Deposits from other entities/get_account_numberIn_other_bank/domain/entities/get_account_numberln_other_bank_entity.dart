class GetAccountNumberInOtherBankResponseEntity {
  final String data;
  final int state;
  final String message;

  GetAccountNumberInOtherBankResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

///GetFavoritesOtherDepositsResponseEntity
class GetFavoritesOtherDepositsResponseEntity {
  final List<GetFavoritesOtherDepositsEntiry> data;
  final int state;
  final String message;

  GetFavoritesOtherDepositsResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetFavoritesOtherDepositsEntiry {
  final int idFavoritosDepositosOtrosBancos;
  final int idUser;
  final String nombreDepositante;
  final String accountOrigin;
  final int idBankOrigin;
  final String bankOriginName;
  final String titular;

  GetFavoritesOtherDepositsEntiry({
    required this.idFavoritosDepositosOtrosBancos,
    required this.idUser,
    required this.nombreDepositante,
    required this.accountOrigin,
    required this.idBankOrigin,
    required this.bankOriginName,
    required this.titular,
  });
}
