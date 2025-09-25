class GetAchBanksListResponseEntity {
  final GetAchBanckEntity data;
  final int state;
  final String message;

  GetAchBanksListResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetAchBanckEntity {
  final List<ColBankEntity> colBanks;
  final String inactiveBanks;
  final List<dynamic> colFavorites;
  final ObjParamsEntity objParams;

  GetAchBanckEntity({
    required this.colBanks,
    required this.inactiveBanks,
    required this.colFavorites,
    required this.objParams,
  });
}

class ColBankEntity {
  final int idBank;
  final String bank;
  final String bankCode;

  ColBankEntity({
    required this.idBank,
    required this.bank,
    required this.bankCode,
  });
}

class ObjParamsEntity {
  final int idParametrosTransInterbank;
  final int minAmountBs;
  final int minAmountSus;
  final bool enableShipping;
  final dynamic message;

  ObjParamsEntity({
    required this.idParametrosTransInterbank,
    required this.minAmountBs,
    required this.minAmountSus,
    required this.enableShipping,
    required this.message,
  });
}
