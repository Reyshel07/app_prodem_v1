part of 'insert_web_references_bloc.dart';

sealed class InsertWebReferencesState {}

final class InsertWebReferencesInitial extends InsertWebReferencesState {}

final class InsertWebReferencesLoading extends InsertWebReferencesState {}

final class InsertWebReferencesError extends InsertWebReferencesState {
  final String message;
  InsertWebReferencesError(this.message);
}

final class InsertWebReferencesSuccess extends InsertWebReferencesState {
  final InsertWebReferencesResponseEntity insertWebReferencesResponseEntity;

  InsertWebReferencesSuccess(this.insertWebReferencesResponseEntity);
}
