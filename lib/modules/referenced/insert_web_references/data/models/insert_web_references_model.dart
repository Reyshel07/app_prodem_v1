import 'dart:convert';
import '../../domain/entities/entity.dart';

InsertWebReferencesResponseModel insertWebReferencesResponseFromJson(
  String str,
) => InsertWebReferencesResponseModel.fromJson(json.decode(str));

class InsertWebReferencesResponseModel
    extends InsertWebReferencesResponseEntity {
  InsertWebReferencesResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory InsertWebReferencesResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => InsertWebReferencesResponseModel(
    data: json["data"],
    state: json["state"],
    message: json["message"],
  );
}
