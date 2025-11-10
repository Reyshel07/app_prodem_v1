part of 'validate_and_save_renovation_dpf_bloc.dart';

sealed class ValidateAndSaveRenovationDpfState {}

final class ValidateAndSaveRenovationDpfInitial
    extends ValidateAndSaveRenovationDpfState {}

final class ValidateAndSaveRenovationDpfLoading
    extends ValidateAndSaveRenovationDpfState {}

final class ValidateAndSaveRenovationDpfError
    extends ValidateAndSaveRenovationDpfState {
  final String message;
  ValidateAndSaveRenovationDpfError(this.message);
}

final class ValidateAndSaveRenovationDpfSuccess
    extends ValidateAndSaveRenovationDpfState {
  final ValidateAndSaveRenovationDpfResponseEntity
  validateAndSaveRenovationDpfResponseEntity;

  ValidateAndSaveRenovationDpfSuccess(
    this.validateAndSaveRenovationDpfResponseEntity,
  );
}
