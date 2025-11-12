part of 'insert_web_references_bloc.dart';

sealed class InsertWebReferencesEvent {}

class InsertWebRefereEvent extends InsertWebReferencesEvent {
  final String idWebReferences;
  final String fullName;
  final String identityCardNumber;
  final String cellPhoneNumber;
  final String kinship;
  final String idcProduct;
  final String productName;
  final String idMoney;
  final String shortName;
  final String ammount;
  final String processDate;
  final String isActive;
  InsertWebRefereEvent({
    required this.idWebReferences,
    required this.fullName,
    required this.identityCardNumber,
    required this.cellPhoneNumber,
    required this.kinship,
    required this.idcProduct,
    required this.productName,
    required this.idMoney,
    required this.shortName,
    required this.ammount,
    required this.processDate,
    required this.isActive,
  });
}
