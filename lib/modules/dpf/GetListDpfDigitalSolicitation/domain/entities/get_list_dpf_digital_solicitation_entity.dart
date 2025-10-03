class GetListDpfDigitalSolicitationResponseEntity {
  final List<GetListDpfDigitalSolicitationEntity> data;
  final int state;
  final String message;

  GetListDpfDigitalSolicitationResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetListDpfDigitalSolicitationEntity {
  final int idDpfDigitalSolicitation;
  final double idPerson;
  final int rate;
  final String product;
  final int amount;
  final int idOffice;
  final String observations;
  final int idMoney;
  final int idDpfWebSolicitation;
  final int idFixedTermDepositSolicitation;
  final int idcState;
  final String realDate;
  final String state;
  final String holder;
  final String moneyName;
  final String officeName;
  final String term;

  GetListDpfDigitalSolicitationEntity({
    required this.idDpfDigitalSolicitation,
    required this.idPerson,
    required this.rate,
    required this.product,
    required this.amount,
    required this.idOffice,
    required this.observations,
    required this.idMoney,
    required this.idDpfWebSolicitation,
    required this.idFixedTermDepositSolicitation,
    required this.idcState,
    required this.realDate,
    required this.state,
    required this.holder,
    required this.moneyName,
    required this.officeName,
    required this.term,
  });
}
