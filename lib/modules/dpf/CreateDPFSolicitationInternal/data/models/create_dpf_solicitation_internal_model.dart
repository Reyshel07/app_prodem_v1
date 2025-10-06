
import 'dart:convert';

import 'package:app_prodem_v1/modules/dpf/CreateDPFSolicitationInternal/domain/entities/create_dpf_solicitation_internal_entity.dart';

CreateDpfSolicitationInternalResponseModel createDpfSolicitationInternalResponseFromJson(String str) => CreateDpfSolicitationInternalResponseModel.fromJson(json.decode(str));


class CreateDpfSolicitationInternalResponseModel extends CreateDpfSolicitationInternalResponseEntity{

    CreateDpfSolicitationInternalResponseModel({
        required super.data,
        required super.state,
        required super.message,
    });

    factory CreateDpfSolicitationInternalResponseModel.fromJson(Map<String, dynamic> json) => CreateDpfSolicitationInternalResponseModel(
        data: CreateDpfSolicitationInternalModel.fromJson(json["data"]),
        state: json["state"],
        message: json["message"],
    );


}

class CreateDpfSolicitationInternalModel extends CreateDpfSolicitationInternalEntity {
    CreateDpfSolicitationInternalModel({
        required super.idTransaction,
        required super.reportToPrint,
        required super.reportToPrintForm,
        required super.resultCode,
        required super.errorMessage,
        required super.reportString,
    });

    factory CreateDpfSolicitationInternalModel.fromJson(Map<String, dynamic> json) => CreateDpfSolicitationInternalModel(
        idTransaction: json["idTransaction"]?.toDouble(),
        reportToPrint: json["reportToPrint"],
        reportToPrintForm: json["reportToPrintForm"],
        resultCode: json["resultCode"],
        errorMessage: json["errorMessage"],
        reportString: json["reportString"],
    );


}
