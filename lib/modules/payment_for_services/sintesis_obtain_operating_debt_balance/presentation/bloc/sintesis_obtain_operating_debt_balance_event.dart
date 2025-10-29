part of 'sintesis_obtain_operating_debt_balance_bloc.dart';

sealed class SintesisObtainOperatingDebtBalanceEvent {}

class SintesisObtainOperatingDebtBalanEvent
    extends SintesisObtainOperatingDebtBalanceEvent {
  final String externalModule;
  final String searchCriteria;
  final List<String> searchParameter;
  final String originType;
  final bool isMobileAPP;
  final String idOffice;
  final String idCAI;
  final bool isFavorite;
  final String favoriteName;
  final String externalModuleReference;
  SintesisObtainOperatingDebtBalanEvent({
    required this.externalModule,
    required this.externalModuleReference,
    required this.favoriteName,
    required this.idCAI,
    required this.idOffice,
    required this.isFavorite,
    required this.isMobileAPP,
    required this.originType,
    required this.searchCriteria,
    required this.searchParameter,
  });
}
