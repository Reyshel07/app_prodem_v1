import 'dart:convert';
import '../../domain/entities/entity.dart';

InforAccionesResponse inforAccionesResponseFromJson(String str) =>
    InforAccionesResponse.fromJson(json.decode(str));

class InforAccionesResponse extends InforAccionesResponseEntity {
  InforAccionesResponse({
    required super.data,
    required super.state,
    required super.message,
  });

  factory InforAccionesResponse.fromJson(Map<String, dynamic> json) =>
      InforAccionesResponse(
        data: List<InforAccionesModel>.from(
          json["data"].map((x) => InforAccionesModel.fromJson(x)),
        ),
        state: json["state"],
        message: json["message"],
      );
}

class InforAccionesModel extends InforAccionesEntity {
  InforAccionesModel({
    required super.info,
    required super.idTipoOperacion,
    required super.tipo,
    required super.grupo,
    required super.dpfExpiracion,
  });

  factory InforAccionesModel.fromJson(Map<String, dynamic> json) =>
      InforAccionesModel(
        info: json["info"],
        idTipoOperacion: json["idTipoOperacion"],
        tipo: json["tipo"],
        grupo: json["grupo"],
        dpfExpiracion: List<DpfExpiracionModel>.from(
          json["dpfExpiracion"].map((x) => DpfExpiracionModel.fromJson(x)),
        ),
      );
}

class DpfExpiracionModel extends DpfExpiracionEntity {
  DpfExpiracionModel({
    required super.idFixedTermDepositAccount,
    required super.codigoDpf,
    required super.monto,
    required super.idMoney,
    required super.interes,
    required super.impuestoCierre,
    required super.impuestoXRenovar,
    required super.capitalARenovar,
    required super.moneda,
    required super.depositProduct,
    required super.idDepositProduct,
    required super.countIdPerson,
    required super.messageCountIdPerson,
    required super.esPignorado,
    required super.hashSeguimiento,
    required super.idOffice,
    required super.oficina,
    required super.idDeptoMf,
    required super.departamento,
    required super.messagePignorado,
    required super.dateExpirationtxt,
    required super.termTxt,
    required super.rateTxt,
  });

  factory DpfExpiracionModel.fromJson(Map<String, dynamic> json) =>
      DpfExpiracionModel(
        idFixedTermDepositAccount: json["idFixedTermDepositAccount"],
        codigoDpf: json["codigoDPF"],
        monto: json["monto"],
        idMoney: json["idMoney"],
        interes: json["interes"].toDouble(),
        impuestoCierre: json["impuestoCierre"],
        impuestoXRenovar: json["impuestoXRenovar"],
        capitalARenovar: json["capitalARenovar"],
        moneda: json["moneda"],
        depositProduct: json["depositProduct"],
        idDepositProduct: json["idDepositProduct"],
        countIdPerson: json["countIdPerson"],
        messageCountIdPerson: json["messageCountIdPerson"],
        esPignorado: json["esPignorado"],
        hashSeguimiento: json["hashSeguimiento"],
        idOffice: json["idOffice"],
        oficina: json["oficina"],
        idDeptoMf: json["idDeptoMF"],
        departamento: json["departamento"],
        messagePignorado: json["messagePignorado"],
        dateExpirationtxt: json["dateExpirationtxt"],
        termTxt: json["termTxt"],
        rateTxt: json["rateTxt"],
      );
}
