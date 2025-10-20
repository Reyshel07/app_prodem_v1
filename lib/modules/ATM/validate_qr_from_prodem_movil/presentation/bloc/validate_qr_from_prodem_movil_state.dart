part of 'validate_qr_from_prodem_movil_bloc.dart';

sealed class ValidateQrFromProdemMovilState {}

final class ValidateQrFromProdemMovilInitial
    extends ValidateQrFromProdemMovilState {}

final class ValidateQrFromProdemMovilLoading
    extends ValidateQrFromProdemMovilState {}

final class ValidateQrFromProdemMovilError
    extends ValidateQrFromProdemMovilState {
  final String message;
  ValidateQrFromProdemMovilError(this.message);
}

final class ValidateQrFromProdemMovilSuccess
    extends ValidateQrFromProdemMovilState {
  ValidateQrFromProdemMovilResponseEntity
  validateQrFromProdemMovilResponseEntity;
  ValidateQrFromProdemMovilSuccess(
    this.validateQrFromProdemMovilResponseEntity,
  );
}
