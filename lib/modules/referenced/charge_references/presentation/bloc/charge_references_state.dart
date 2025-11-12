part of 'charge_references_bloc.dart';

sealed class ChargeReferencesState {}

final class ChargeReferencesInitial extends ChargeReferencesState {}

final class ChargeReferencesLoading extends ChargeReferencesState {}

final class ChargeReferencesError extends ChargeReferencesState {
  final String message;
  ChargeReferencesError(this.message);
}

final class ChargeReferencesSuccess extends ChargeReferencesState {
  final ChargeReferencesResponseEntity chargeReferencesResponseEntity;

  ChargeReferencesSuccess(this.chargeReferencesResponseEntity);
}
