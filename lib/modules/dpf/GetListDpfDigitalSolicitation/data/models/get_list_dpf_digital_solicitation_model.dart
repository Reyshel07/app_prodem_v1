import 'dart:convert';
import '../../domain/entities/entity.dart';

GetListDpfDigitalSolicitationResponse
getListDpfDigitalSolicitationResponseFromJson(String str) =>
    GetListDpfDigitalSolicitationResponse.fromJson(json.decode(str));

class GetListDpfDigitalSolicitationResponse
    extends GetListDpfDigitalSolicitationResponseEntity {
  GetListDpfDigitalSolicitationResponse({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetListDpfDigitalSolicitationResponse.fromJson(
    Map<String, dynamic> json,
  ) => GetListDpfDigitalSolicitationResponse(
    data: List<GetListDpfDigitalSolicitationModel>.from(
      json["data"].map((x) => GetListDpfDigitalSolicitationModel.fromJson(x)),
    ),
    state: json["state"],
    message: json["message"],
  );
}

class GetListDpfDigitalSolicitationModel
    extends GetListDpfDigitalSolicitationEntity {
  GetListDpfDigitalSolicitationModel({
    required super.idDpfDigitalSolicitation,
    required super.idPerson,
    required super.rate,
    required super.product,
    required super.amount,
    required super.idOffice,
    required super.observations,
    required super.idMoney,
    required super.idDpfWebSolicitation,
    required super.idFixedTermDepositSolicitation,
    required super.idcState,
    required super.realDate,
    required super.state,
    required super.holder,
    required super.moneyName,
    required super.officeName,
    required super.term,
  });

  factory GetListDpfDigitalSolicitationModel.fromJson(
    Map<String, dynamic> json,
  ) => GetListDpfDigitalSolicitationModel(
    idDpfDigitalSolicitation: json["idDpfDigitalSolicitation"],
    idPerson: json["idPerson"].toDouble(),
    rate: json["rate"],
    product: json["product"],
    amount: json["amount"],
    idOffice: json["idOffice"],
    observations: json["observations"],
    idMoney: json["idMoney"],
    idDpfWebSolicitation: json["idDPFWebSolicitation"],
    idFixedTermDepositSolicitation: json["idFixedTermDepositSolicitation"],
    idcState: json["idcState"],
    realDate: json["realDate"],
    state: json["state"],
    holder: json["holder"],
    moneyName: json["moneyName"],
    officeName: json["officeName"],
    term: json["term"],
  );
}
