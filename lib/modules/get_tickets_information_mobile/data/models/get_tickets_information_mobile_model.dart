import 'dart:convert';
import '../../domain/entities/entity.dart';

GetTicketsInformationMobileResponseModel
getTicketsInformationMobileResponseFromJson(String str) =>
    GetTicketsInformationMobileResponseModel.fromJson(json.decode(str));

class GetTicketsInformationMobileResponseModel
    extends GetTicketsInformationMobileResponseEntity {
  GetTicketsInformationMobileResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetTicketsInformationMobileResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetTicketsInformationMobileResponseModel(
    data: GetTicketsInformationMobileModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class GetTicketsInformationMobileModel
    extends GetTicketsInformationMobileEntity {
  GetTicketsInformationMobileModel({
    required super.colTicketInfomation,
    required super.colTickets,
  });

  factory GetTicketsInformationMobileModel.fromJson(
    Map<String, dynamic> json,
  ) => GetTicketsInformationMobileModel(
    colTicketInfomation: json["colTicketInfomation"],
    colTickets: json["colTickets"],
  );
}
