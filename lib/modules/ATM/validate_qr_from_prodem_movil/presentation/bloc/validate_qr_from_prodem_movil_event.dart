part of 'validate_qr_from_prodem_movil_bloc.dart';

sealed class ValidateQrFromProdemMovilEvent {}

class ValidateQrFromPRodemMEvent extends ValidateQrFromProdemMovilEvent {
  final String qrCode;
  ValidateQrFromPRodemMEvent({required this.qrCode});
}
