import 'dart:convert';
import '../../domain/entities/entity.dart';

ChargeReferencesResponseModel chargeReferencesResponseModelFromJson(
  String str,
) => ChargeReferencesResponseModel.fromJson(json.decode(str));

class ChargeReferencesResponseModel extends ChargeReferencesResponseEntity {
  ChargeReferencesResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory ChargeReferencesResponseModel.fromJson(Map<String, dynamic> json) =>
      ChargeReferencesResponseModel(
        data: ChargeReferencesModel.fromJson(json["data"]),
        state: json["state"],
        message: json["message"],
      );
}

class ChargeReferencesModel extends ChargeReferencesEntity {
  ChargeReferencesModel({
    required super.colTypes,
    required super.colMoneys,
    required super.colReferences,
  });

  factory ChargeReferencesModel.fromJson(Map<String, dynamic> json) =>
      ChargeReferencesModel(
        colTypes: List<ColModel>.from(
          json["colTypes"].map((x) => ColModel.fromJson(x)),
        ),
        colMoneys: List<ColModel>.from(
          json["colMoneys"].map((x) => ColModel.fromJson(x)),
        ),
        colReferences: List<ColReference>.from(
          json["colReferences"].map((x) => ColReference.fromJson(x)),
        ),
      );
}

class ColModel extends ColEntity {
  ColModel({
    required super.idClasificador,
    required super.nombre,
    required super.codigo,
  });

  factory ColModel.fromJson(Map<String, dynamic> json) => ColModel(
    idClasificador: json["idClasificador"],
    nombre: json["nombre"],
    codigo: json["codigo"],
  );
}

class ColReference extends ColReferenceEntity {
  ColReference({
    required super.idWebReferences,
    required super.fullName,
    required super.identityCardNumber,
    required super.cellPhoneNumber,
    required super.kinship,
    required super.idcProduct,
    required super.productName,
    required super.idMoney,
    required super.shortName,
    required super.ammount,
    required super.idWebPersonClientRegister,
    required super.processDate,
  });

  factory ColReference.fromJson(Map<String, dynamic> json) => ColReference(
    idWebReferences: json["idWebReferences"],
    fullName: json["fullName"],
    identityCardNumber: json["identityCardNumber"],
    cellPhoneNumber: json["cellPhoneNumber"],
    kinship: json["kinship"],
    idcProduct: json["idcProduct"],
    productName: json["productName"],
    idMoney: json["idMoney"],
    shortName: json["shortName"],
    ammount: json["ammount"],
    idWebPersonClientRegister: json["idWebPersonClientRegister"].toDouble(),
    processDate: DateTime.parse(json["processDate"]),
  );
}
